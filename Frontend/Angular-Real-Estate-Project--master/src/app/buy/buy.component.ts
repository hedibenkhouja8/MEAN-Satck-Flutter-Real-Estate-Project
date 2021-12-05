import { Component, OnInit } from '@angular/core';
import { buys } from '../buy-list';
import { Buy } from '../buy.model';
import { LocalStorageService } from "src/app/services/local-storage.service";
import { FavService } from 'src/app/services/fav.service';
@Component({
  selector: 'app-buy',
  templateUrl: './buy.component.html',
  styleUrls: ['./buy.component.css']
})
export class BuyComponent implements OnInit {
  public buyList: Buy[] = buys;
  public favContent: any[]= [];
  constructor(private favService: FavService ) { }

  ngOnInit(): void {
    
    //this.favContent = this.localStorageService.get('fav');
  }
  public addTofav(id: string):void {
    this.favService.add(id);
}
}