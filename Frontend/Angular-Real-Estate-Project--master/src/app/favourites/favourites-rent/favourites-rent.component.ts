import { Component, OnInit } from '@angular/core';
import { FavRentService } from "src/app/services/fav-rent.service";
import { rents } from "src/app/rent-list";
import { BrowserModule } from '@angular/platform-browser'
@Component({
  selector: 'app-favourites-rent',
  templateUrl: './favourites-rent.component.html',
  styleUrls: ['./favourites-rent.component.css']
})
export class FavouritesRentComponent implements OnInit {
  public favContent: any = [];
  constructor(private favRentService: FavRentService) { }

  ngOnInit(): void {
    this.getfavDetails();
    console.log(this.favContent);
  }
  getfavDetails() {
    this.favContent = this.favRentService.favContent;
    for (let index = 0; index < this.favContent.length; index++) {
      const rent = rents.filter(rent => rent.id == this.favContent[index].id)[0];
     this.favContent[index].title = rent.title;
      this.favContent[index].location = rent.location;
      this.favContent[index].image = rent.image;


}
  }
  
clearFavourites() {
  this.favRentService.clear();
  this.ngOnInit();
}
}
