import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class BuyService {
  private apiUrl='https://my-json-server.typicode.com/hedibenkhouja8/dbjson/buys';

constructor(private http: HttpClient) {}
/**
 *Get all buys
 * @returns Observable<Buy[]>
 */
all() {
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
 * @param course new buy to create
 */
create(buy: any) {
  return this.http.post(this.apiUrl, buy);
}

/**
 * Update a buy with the given id
 * @param id buy id to update
 * @param buy new course data
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
