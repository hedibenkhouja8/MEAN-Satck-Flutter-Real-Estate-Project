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
public buy?:Buy;
  constructor(private route: ActivatedRoute,   private favService: FavService,private buyService: BuyService) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const buyId = params.get("id");
      this.buy = buys.filter(buy => buy.id === buyId)[0];
    });
  }
  public addTofav():void {
    this.favService.add(this.buy?.id);  }

}
