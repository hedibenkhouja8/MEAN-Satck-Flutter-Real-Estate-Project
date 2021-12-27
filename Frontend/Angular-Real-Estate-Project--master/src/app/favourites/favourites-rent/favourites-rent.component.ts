import { Component, OnInit } from '@angular/core';
import { FavRentService } from 'src/app/services/fav-rent.service';
//import { rents } from "src/app/rent-list";
import { RentService } from 'src/app/services/rent.service';
import { BrowserModule } from '@angular/platform-browser';
@Component({
  selector: 'app-favourites-rent',
  templateUrl: './favourites-rent.component.html',
  styleUrls: ['./favourites-rent.component.css'],
})
export class FavouritesRentComponent implements OnInit {
  public favContent: any = [];
  public rents: any = [];
  constructor(
    private favRentService: FavRentService,
    private rentService: RentService
  ) {}

  ngOnInit(): void {
    this.getfavDetails();
    console.log(this.favContent);
  }
  getfavDetails() {
    this.favContent = this.favRentService.favContent;
    this.rentService.all().subscribe((res) => (this.rents = res));
    for (let index = 0; index < this.favContent.length; index++) {
      const rent = this.rents.filter(
        (rent: any) => rent._id == this.favContent[index]._id
      )[0];
      this.favContent[index].title = rent.title;
      this.favContent[index].location = rent.location;
      this.favContent[index].image = rent.image;
      this.favContent[index].owner = rent.owner;
    }
  }

  clearFavourites() {
    this.favRentService.clear();
    this.ngOnInit();
  }
}
