import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class RentService {
  //private apiUrl ='http://localhost:3000/rents';
  private apiUrl='https://my-json-server.typicode.com/labidimalek/public-rents-api/rents';


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
   * @param course new rent to create
   */
  create(rent: any) {
    return this.http.post(this.apiUrl, rent);
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
