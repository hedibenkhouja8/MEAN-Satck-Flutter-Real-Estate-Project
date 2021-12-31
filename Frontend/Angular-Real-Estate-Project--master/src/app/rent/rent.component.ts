import { Component, OnInit } from '@angular/core';
import { rents } from '../rent-list';
import { Rent } from '../rent.model';
import { rentmodel } from './rentmodel.model';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { FavRentService } from 'src/app/services/fav-rent.service';
import { RentService } from '../services/rent.service';
import { FormBuilder, FormGroup } from '@angular/forms';
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
  rentmodel: rentmodel = new rentmodel();
  constructor(
    private favService: FavRentService,
    private rentService: RentService,
    private formBuilder: FormBuilder,
    public router: Router
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
      start_date_available: [''],
      end_date_available: [''],
    });
  }

  ngOnInit(): void {
    this.getAllRents();
  }
  public addTofav(id: string) {
    this.favService.add(id);
  }

  public getAllRents() {
    this.rentService.all().subscribe((res) => (this.rentList = res));
  }
  public addRent() {
    this.rentService.create(this.formValue.value).subscribe((res) => {
      if (res.status == 201) {
        this.formValue.reset();
        alert('house rent added successfully');
        
      window.location.reload();
        this.getAllRents();
      }
    });
  }

  public deleteRent(rent: any) {
    this.rentService.delete(rent._id).subscribe((res) => {
      alert('house rent deleted ');
      this.getAllRents();
    });
  }
  onEditRent(rent: any) {
    this.rentmodel._id = rent._id;
    this.formValue.controls['title'].setValue(rent.title);
    this.formValue.controls['owner'].setValue(rent.owner);
    this.formValue.controls['description'].setValue(rent.description);
    this.formValue.controls['image'].setValue(rent.image);
    this.formValue.controls['size'].setValue(rent.size);
    this.formValue.controls['room_number'].setValue(rent.room_number);
    this.formValue.controls['location'].setValue(rent.location);
    this.formValue.controls['price_per_month'].setValue(rent.price_per_month);
    this.formValue.controls['start_date_available'].setValue(
      rent.start_date_available
    );
    this.formValue.controls['end_date_available'].setValue(
      rent.end_date_available
    );
  }
  UpdateRent() {
    this.rentService
      .update(this.rentmodel._id, this.formValue.value)
      .subscribe((data) => {
        alert('rent updated successfully');
        this.formValue.reset();
        this.router.navigate(['/rent']);
        window.location.reload();
      });
  }
}
