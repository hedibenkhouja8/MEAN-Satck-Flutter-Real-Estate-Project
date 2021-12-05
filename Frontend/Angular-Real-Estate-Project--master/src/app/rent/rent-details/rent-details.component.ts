import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { rents } from 'src/app/rent-list';
import { Rent } from 'src/app/rent.model';
import { FavRentService } from 'src/app/services/fav-rent.service';

@Component({
  selector: 'app-rent-details',
  templateUrl: './rent-details.component.html',
  styleUrls: ['./rent-details.component.css']
})
export class RentDetailsComponent implements OnInit {
  public rent?:Rent;
  constructor(private route: ActivatedRoute,   private favRentService: FavRentService) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const rentId = params.get("id");
      this.rent = rents.filter(rent => rent.id === rentId)[0];
    });
  }
  public addTofav():void {
    this.favRentService.add(this.rent?.id); 
   }
   public removefromfav():void {
    this.favRentService.remove(); 
   }

}

