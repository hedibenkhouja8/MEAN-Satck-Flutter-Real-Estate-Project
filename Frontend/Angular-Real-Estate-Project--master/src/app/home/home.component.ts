import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { buys } from '../buy-list';
import { Buy } from '../buy.model';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { FavService } from 'src/app/services/fav.service';
import { BuyService } from '../services/buy.service';

import { RentService } from '../services/rent.service';
import { FormBuilder,FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

import { BrowserModule } from '@angular/platform-browser'

import { AuthService } from "src/app/services/auth.service";
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  public buyList: any = [];
  
  public rentList: any = [];
  constructor( private buyService: BuyService,private rentService: RentService) { }

  ngOnInit(): void {this.getAllBuys();
this.getAllRents();
   
  }
  
  
  reloadPage() {
    setTimeout(()=>{
      window.location.reload();
    }, 1);
  }
  
public getAllBuys(){
  this.buyService.alla().subscribe((res) => (this.buyList = res));

}

public getAllRents(){
  this.rentService.all().subscribe((res) => (this.rentList = res));

}
}
