import { Injectable } from '@angular/core';

import { LocalStorageService } from "src/app/services/local-storage.service";

import { Rent } from "src/app/rent.model";
@Injectable({
  providedIn: 'root'
})
export class FavRentService {

 
  public favContent: any = [];

  constructor(
    private localStorageService: LocalStorageService
  ) {
    this.favContent = this.load();
  }

  add(productID?: string) {
 
    if(!this.favContent.filter((elem: Rent) => elem.id === productID)[0]) {
      this.favContent.push({id: productID})
    }

    this.localStorageService.set('fav-rent', this.favContent);
  }
  remove(productID?: string) {
 

    this.localStorageService.clear('fav-rent');
  }
/*  remove2(productID?: string) {
 
    var items = localStorage["fav-rent"];
    for (var i =0; i< items.length; i++) {
        var item = JSON.parse(items[i]);
        if (item.itemId == productID) {
            items.slice(i);
            break;
        }
    }
    
    // Don't forget to store the result back in localStorage
    localStorage.setItem("fav-rent", items)
  }*/

  load() {
    return this.localStorageService.get('fav-rent')
  }

}
