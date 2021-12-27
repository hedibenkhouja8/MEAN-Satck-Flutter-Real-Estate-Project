import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { buys } from 'src/app/buy-list';
import { Buy } from 'src/app/buy.model';
import { FavService } from 'src/app/services/fav.service';
import { BuyService } from 'src/app/services/buy.service';

@Component({
  selector: 'app-description',
  templateUrl: './description.component.html',
  styleUrls: ['./description.component.css']
})
export class DescriptionComponent implements OnInit { 
   id = this.route.snapshot.params['id'];
   list: any;
   buy = {
     title: '',
     owner: '',
     description: '',
     image: '',
     size: 0,
     room_number: 0,
     location: '',
     price: 0
   };
  constructor(private route: ActivatedRoute,   private favService: FavService,private buyService: BuyService) { }

  ngOnInit(): void {
      this.buyService.get(this.id).subscribe((data) => {
        this.list = data;
        this.buy = this.list;
    });
    /*this.buyService.get(this.id).subscribe(
      res => this.buyList = res
    );*/
  }
  public addTofav():void {
    this.favService.add(this.id);  }

}
