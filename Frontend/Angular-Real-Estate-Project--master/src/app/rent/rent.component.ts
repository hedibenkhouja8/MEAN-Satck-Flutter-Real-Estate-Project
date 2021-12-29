import { Component, OnInit } from '@angular/core';
import { rents } from '../rent-list';
import { Rent } from '../rent.model';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { FavRentService } from 'src/app/services/fav-rent.service';
import { RentService } from '../services/rent.service';
import { FormBuilder,FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
@Component({
  selector: 'app-rent',
  templateUrl: './rent.component.html',
  styleUrls: ['./rent.component.css'],
})
export class RentComponent implements OnInit {
  public rentList: any = [];
  public favContent: any[] = [];
  public formValue: FormGroup;
  constructor(
    private favService: FavRentService,
    private rentService: RentService,
    private formBuilder:FormBuilder,
    public router:Router
  ) {
    this.formValue = this.formBuilder.group({
      title: [''],
      owner: [''],
      description: [''],
      image: [''],
      size: [''],
      room_number: [''],
      location: [''],
      price_per_month: [''],
      start_date_available:[''],
      end_date_available : ['']

    });
  }

  ngOnInit(): void {
    this.rentService.all().subscribe((res) => (this.rentList = res));
  }
  public addTofav(id: string): void {
    this.favService.add(id);
  }
  public addRent() {
    this.rentService.create(this.formValue.value).subscribe(res => {

      if(res.status == 201) {
        this.formValue.reset();
        this.router.navigate(['/rent']);
        window.location.reload();
      }
    });

  }
}
