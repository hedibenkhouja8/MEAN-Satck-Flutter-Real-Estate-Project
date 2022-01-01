import { Component, OnInit } from '@angular/core';
import { buys } from '../buy-list';
import { Buy } from '../buy.model';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { FavService } from 'src/app/services/fav.service';
import { BuyService } from '../services/buy.service';
import { FormBuilder,FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { buymodel } from './buymodel.model';
@Component({
  selector: 'app-buy',
  templateUrl: './buy.component.html',
  styleUrls: ['./buy.component.css']
})
export class BuyComponent implements OnInit {
  public buyList: any = [];
  public favContent: any[]= [];
  public formValue: FormGroup;
  
buymodel: buymodel = new buymodel();
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
    
    this.buyService.alla().subscribe(
      res => this.buyList = res
    );
    console.log(this.buyList);
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
public getAllBuys(){
  this.buyService.alla().subscribe((res) => (this.buyList = res));

}
public deleteBuy(buy : any){
  this.buyService.delete(buy._id).subscribe(res => {
   
  
    this.getAllBuys();

});
}
onEditbuy(buy : any){
  this.buymodel._id = buy._id;
  this.formValue.controls['title'].setValue(buy.title);
  this.formValue.controls['owner'].setValue(buy.owner);
  this.formValue.controls['description'].setValue(buy.description);
  this.formValue.controls['image'].setValue(buy.image);
  this.formValue.controls['size'].setValue(buy.size);
  this.formValue.controls['room_number'].setValue(buy.room_number);
  this.formValue.controls['location'].setValue(buy.location);
  this.formValue.controls['price'].setValue(buy.price);
}
UpdateBuy() {
  this.buyService
    .update(this.buymodel._id, this.formValue.value)
    .subscribe((data) => {
      alert('buy updated successfully');
      this.formValue.reset();
      this.router.navigate(['/buy']);
      window.location.reload();
    });
}
}
