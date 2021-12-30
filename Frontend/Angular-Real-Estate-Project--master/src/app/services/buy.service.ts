import { Injectable } from '@angular/core';
import { HttpClient,HttpErrorResponse,HttpHeaders } from '@angular/common/http';

import { Buy } from 'src/app/buy.model';

import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class BuyService {
  private apiUrl='http://localhost:3000/api/buys';

  headers = new HttpHeaders().set('Accept', 'multipart/form-data');

constructor(private http: HttpClient) {}
/**
 *Get all buys
 * @returns Observable<Buy[]>
 */
alla() {
  return this.http.get(this.apiUrl);
}

/**
 * Get a buy with the given id
 * @param id : buy id
 * @returns Observable<Buy>
 */
get(id: string) {
  return this.http.get(this.apiUrl + '/' + id);
}

/**
 * Create a new buy
 * @param buy new buy to create
 */

create(buy: Buy): Observable<any> {

  return this.http.post(this.apiUrl, buy).pipe(
      catchError(this.handleError)
  )
}

handleError(error: HttpErrorResponse) {
  let msg = '';
  if (error.error instanceof ErrorEvent) {
    // client-side error
    msg = error.error.message;
  } else {
    // server-side error
    msg = `Error Code: ${error.status}\nMessage: ${error.message}`;
  }
  return throwError(msg);
}

/**
 * Update a buy with the given id
 * @param id buy id to update
 * @param buy new buy data
 */
update(id: string, buy: any) {
  return this.http.put(this.apiUrl + '/' + id, buy);
}

/**
 * Delete a buy with the given id
 * @param id buy id to delete
 */
delete(id: string) {
  return this.http.delete(this.apiUrl + '/' + id);
}
}
