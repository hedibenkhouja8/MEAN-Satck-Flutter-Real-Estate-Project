import { Injectable } from '@angular/core';
import { HttpClient,HttpErrorResponse,HttpHeaders  } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class RentService {
  //private apiUrl ='http://localhost:3000/rents'; //json url
  //private apiUrl='https://my-json-server.typicode.com/labidimalek/public-rents-api/rents';
  private apiUrl ='http://localhost:3000/api/rents';


  constructor(private http: HttpClient) {}
  /**
   *Get all rents
   * @returns Observable<Rent[]>
   */
  all() {
    return this.http.get(this.apiUrl);
  }

  /**
   * Get a rent with the given id
   * @param id : rent id
   * @returns Observable<Rent>
   */
  get(id?: string) {
    return this.http.get(this.apiUrl + '/' + id);
  }

  /**
   * Create a new rent
   * @param rent new rent to create
   */
  create(rent: any) :Observable<any>  {
    return this.http.post(this.apiUrl, rent).pipe(
      catchError(this.handleError)
  )
  }
  /**
   *
   * @param error 
   * @returns
   */
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
   * Update a rent with the given id
   * @param id rent id to update
   * @param rent new course data
   */
  update(id: string, rent: any) {
    return this.http.put(this.apiUrl + '/' + id, rent);
  }

  /**
   * Delete a rent with the given id
   * @param id rent id to delete
   */
  delete(id: string) {
    return this.http.delete(this.apiUrl + '/' + id);
  }
}
