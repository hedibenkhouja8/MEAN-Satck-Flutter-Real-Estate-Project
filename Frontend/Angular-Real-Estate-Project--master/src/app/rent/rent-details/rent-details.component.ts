import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { rents } from 'src/app/rent-list';
import { Rent } from 'src/app/rent.model';
import { RentService } from './../../../app/services/rent.service';
import { FavRentService } from 'src/app/services/fav-rent.service';

@Component({
  selector: 'app-rent-details',
  templateUrl: './rent-details.component.html',
  styleUrls: ['./rent-details.component.css'],
})
export class RentDetailsComponent implements OnInit {
  // public rent?:Rent;
  id = this.route.snapshot.params['id'];
  list: any;
  rent = {
    title: '',
    owner: '',
    description: '',
    image: '',
    size: 0,
    room_number: 0,
    location: '',
    price_per_month: 0,
    start_date_available: '',
    end_date_available: '',
  };
  constructor(
    private route: ActivatedRoute,
    private favRentService: FavRentService,
    private rentService: RentService
  ) {}

  ngOnInit(): void {
    /*  this.route.paramMap.subscribe(params => {
      const rentId = params.get("id");
      this.rent = rents.filter(rent => rent.id === rentId)[0];
    });*/
    this.rentService.get(this.id).subscribe((data) => {
      this.list = data;
      this.rent = this.list;
    });
  }
  public addTofav(): void {
    this.favRentService.add(this.id);
  }
  public removefromfav(): void {
    this.favRentService.remove();
  }
}
