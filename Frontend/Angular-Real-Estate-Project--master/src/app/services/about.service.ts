import { Injectable } from '@angular/core';
import { HttpClient,HttpErrorResponse,HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AboutService {

  constructor(private http: HttpClient) { }

 // private apiUrl='http://localhost:3000/abouts'
 //private apiUrl='https://my-json-server.typicode.com/yousseff650/public-about-api/abouts'
 private apiUrl ='http://localhost:3000/api/abouts';
 /**
  * Get all Agencys About
  * @returns Observable<About[]>
  */
   all(){
    return this.http.get(this.apiUrl);
  }

  /**
   * Get a Agency about with the given id
   * @param id  :about id
   * @returns Observable<About>
   */
  get(id:string){
    return this.http.get(this.apiUrl + '/' + id);
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
   * Create a new Agency about
   * @param about new agency to create
   */
   create(about: any):Observable<any>  {
    return this.http.post(this.apiUrl, about).pipe(catchError(this.handleError));
  }

  /**
   * Update a agency about with the given id
   * @param id agency about id to update
   * @param about new agency about data
   */
   update(id: string, about: any) {
    return this.http.put(this.apiUrl + '/' + id, about);
  }

    /**
   * Delete a agency about with the given id
   * @param id agency about id to delete
   */
  delete(id: string) {
    return this.http.delete(this.apiUrl + '/' + id);
  }
  
}
