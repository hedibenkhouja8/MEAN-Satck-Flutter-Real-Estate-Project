import { Component, OnInit } from '@angular/core';
import { rents } from '../rent-list';
import { Rent } from '../rent.model';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { FavRentService } from 'src/app/services/fav-rent.service';
import { RentService } from '../services/rent.service';
@Component({
  selector: 'app-rent',
  templateUrl: './rent.component.html',
  styleUrls: ['./rent.component.css'],
})
export class RentComponent implements OnInit {
  public rentList: any = [];
  public favContent: any[] = [];
  constructor(
    private favService: FavRentService,
    private rentService: RentService
  ) {}

  ngOnInit(): void {
    this.rentService.all().subscribe((res) => (this.rentList = res));
  }
  public addTofav(id: string): void {
    this.favService.add(id);
  }
}
