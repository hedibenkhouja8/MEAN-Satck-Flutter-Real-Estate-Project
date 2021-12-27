import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';


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
   * Create a new Agency about
   * @param about new agency to create
   */
   create(about: any) {
    return this.http.post(this.apiUrl, about);
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
