import { Injectable } from '@angular/core';

import { LocalStorageService } from "src/app/services/local-storage.service";

import { Buy } from "src/app/buy.model";

@Injectable({
  providedIn: 'root'
})
export class FavService {

  public favContent: any = [];

  constructor(
    private localStorageService: LocalStorageService
  ) {
    this.favContent = this.load();
  }

  add(productID?: string) {
 
    if(!this.favContent.filter((elem: Buy) => elem.id === productID)[0]) {
      this.favContent.push({id: productID})
    }

    this.localStorageService.set('fav-buy', this.favContent);
  }

  load() {
    return this.localStorageService.get('fav-buy')
  }


  // public get() {
  //   return this.cartContent;
  // }

}
