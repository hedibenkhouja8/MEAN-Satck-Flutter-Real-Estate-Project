import { Component, OnInit } from '@angular/core';
import { Agencys } from '../about-list';
import { Agency } from '../about.model';

import { FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';

import { LocalStorageService } from 'src/app/services/local-storage.service';
import { AboutService } from '../services/about.service';
import { aboutmodel } from './aboutmodel.model';

import { AuthService } from "src/app/services/auth.service";


@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

   public agencyList: any =[];
   currentUser: any;
   public formValue: FormGroup;
   aboutmodel: aboutmodel = new aboutmodel();
  constructor( private localStorageService: LocalStorageService,
    public authService: AuthService,
    private aboutService: AboutService,
    private formBuilder: FormBuilder,
    public router: Router
  ) {this.formValue = this.formBuilder.group({
    owner: [''],
    image_owner: [''],
    mail: [''],
    phone: [''],
    location: [''],
    image_location:[''],
    siege_social: [''],
    date_creation: [''],
    horaire: [''],
    description: [''],
  }); 
  this.currentUser = this.localStorageService.get('user');}

  ngOnInit(): void {
    this.getAllAbouts();
  }
  public getAllAbouts(){
    this.aboutService.all().subscribe((res) => (this.agencyList = res));;
  }

  
  public addAbout() {
    this.aboutService.create(this.formValue.value).subscribe((res) => {
      if (res.status == 201) {
        this.formValue.reset();
        alert('Agency added successfully');
        
      window.location.reload();
        this.getAllAbouts();
      }
    });
  }


  onEditAbout(about: any) {
    this.aboutmodel._id = about._id;
    this.formValue.controls['owner'].setValue(about.owner);
    this.formValue.controls['image_owner'].setValue(about.image_owner);
    this.formValue.controls['mail'].setValue(about.mail);
    this.formValue.controls['phone'].setValue(about.phone);
    this.formValue.controls['location'].setValue(about.location);
    this.formValue.controls['image_location'].setValue(about.image_location);
    this.formValue.controls['siege_social'].setValue(about.siege_social);
    this.formValue.controls['date_creation'].setValue(about.date_creation);
    this.formValue.controls['horaire'].setValue(about.horaire);
    this.formValue.controls['description'].setValue(about.description);
  }
  UpdateAbout() {
    this.aboutService
      .update(this.aboutmodel._id, this.formValue.value)
      .subscribe((data) => {
        alert('Agency updated successfully');
        this.formValue.reset();
        this.router.navigate(['/about']);
        window.location.reload();
      });
  }

  public delete(about: any) {
    this.aboutService.delete(about._id).subscribe((res) => {
      alert('Agency deleted ');
      this.getAllAbouts();
    });
  }
}
