import { Component, OnInit } from '@angular/core';
import { FavService } from "src/app/services/fav.service";
import { buys } from "src/app/buy-list";
import { BrowserModule } from '@angular/platform-browser'


@Component({
  selector: 'app-favourites-buy',
  templateUrl: './favourites-buy.component.html',
  styleUrls: ['./favourites-buy.component.css']
})
export class FavouritesBuyComponent implements OnInit {

  public favContent: any = [];

  constructor( private favService: FavService) { }
  ngOnInit(): void {
    this.getfavDetails();
    console.log(this.favContent);
  }
  getfavDetails() {
    this.favContent = this.favService.favContent;
    for (let index = 0; index < this.favContent.length; index++) {
      const buy = buys.filter(buy => buy.id == this.favContent[index].id)[0];
     this.favContent[index].title = buy.title;
      this.favContent[index].location = buy.location;
      this.favContent[index].image = buy.image;


}
  }
}
