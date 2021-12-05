import { Component, OnInit } from '@angular/core';
import { rents } from '../rent-list';
import { Rent } from '../rent.model';
import { LocalStorageService } from "src/app/services/local-storage.service";
import { FavRentService } from 'src/app/services/fav-rent.service';
@Component({
  selector: 'app-rent',
  templateUrl: './rent.component.html',
  styleUrls: ['./rent.component.css']
})
export class RentComponent implements OnInit {
  public rentList: Rent[] = rents;  public favContent: any[]= [];
  constructor(private favService: FavRentService ) { }
 

  ngOnInit(): void {
  }
  public addTofav(id: string):void {
    this.favService.add(id);
}
}
