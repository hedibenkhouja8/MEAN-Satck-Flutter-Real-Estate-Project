import { Component, OnInit } from '@angular/core';
import { buys } from '../buy-list';
import { Buy } from '../buy.model';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { FavService } from 'src/app/services/fav.service';
import { BuyService } from '../services/buy.service';
@Component({
  selector: 'app-buy',
  templateUrl: './buy.component.html',
  styleUrls: ['./buy.component.css']
})
export class BuyComponent implements OnInit {
  public buyList: any = [];
  public favContent: any[]= [];
  constructor(private favService: FavService,    private buyService: BuyService ) { }

  ngOnInit(): void {
    
    //this.favContent = this.localStorageService.get('fav');
    this.buyService.all().subscribe(
      res => this.buyList = res
    );
  }
  public addTofav(id: string):void {
    this.favService.add(id);
}
}