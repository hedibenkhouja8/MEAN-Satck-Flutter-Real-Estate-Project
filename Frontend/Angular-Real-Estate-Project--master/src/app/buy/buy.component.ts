import { Component, OnInit } from '@angular/core';
import { buys } from '../buy-list';
import { Buy } from '../buy.model';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { FavService } from 'src/app/services/fav.service';
import { BuyService } from '../services/buy.service';
import { FormBuilder,FormGroup } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-buy',
  templateUrl: './buy.component.html',
  styleUrls: ['./buy.component.css']
})
export class BuyComponent implements OnInit {
  public buyList: any = [];
  public favContent: any[]= [];
  public formValue: FormGroup;
  constructor(private favService: FavService,private formBuilder:FormBuilder,    private buyService: BuyService ,public router:Router) {
    this.formValue = this.formBuilder.group({
      title: [''],
      owner: [''],
      description: [''],
      image: [''],
      size: [''],
      room_number: [''],
      location: [''],
      price: ['']

    });
   }

  ngOnInit(): void {
    
    this.buyService.all().subscribe(
      res => this.buyList = res
    );
  }
  public addTofav(id: string):void {
    this.favService.add(id);
}
addbuy() {
  this.buyService.create(this.formValue.value).subscribe(res => {
    
    if(res.status == 201) {
      this.formValue.reset();
      this.router.navigate(['/buy']);
      window.location.reload();
    }
  });
}
}