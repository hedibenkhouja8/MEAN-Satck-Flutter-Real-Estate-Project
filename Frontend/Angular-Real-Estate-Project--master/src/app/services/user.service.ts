import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
@Injectable({
  providedIn: 'root'
})
export class UserService {
  private apiUrl='https://my-json-server.typicode.com/oussama-abid/Fakeapi/users';

  constructor(private http: HttpClient) {}
  /**
   *Get all users
   * @returns Observable<User[]>
   */
  all() {
    return this.http.get(this.apiUrl);
  }
  
  /**
   * Get a user with the given id
   * @param id : user id
   * @returns Observable<User>
   */
  get(id: string) {
    return this.http.get(this.apiUrl + '/' + id);
  }
  
  /**
   * Create a new User
   * @param user new user to create
   */
  create(user: any) {
    return this.http.post(this.apiUrl, user);
  }
  
  /**
   * Update a user with the given id
   * @param id user id to update
   * @param user new user data
   */
  update(id: string, user: any) {
    return this.http.put(this.apiUrl + '/' + id, user);
  }
  
  /**
   * Delete a user with the given id
   * @param id user id to delete
   */
  delete(id: string) {
    return this.http.delete(this.apiUrl + '/' + id);
  }
}
