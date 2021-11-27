import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { rents } from 'src/app/rent-list';
import { Rent } from 'src/app/rent.model';

@Component({
  selector: 'app-rent-details',
  templateUrl: './rent-details.component.html',
  styleUrls: ['./rent-details.component.css']
})
export class RentDetailsComponent implements OnInit {
  public rent?:Rent;
  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const rentId = params.get("id");
      this.rent = rents.filter(rent => rent.id === rentId)[0];
    });
  }

}
