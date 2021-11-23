import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { buys } from 'src/app/buy-list';
import { Buy } from 'src/app/buy.model';

@Component({
  selector: 'app-description',
  templateUrl: './description.component.html',
  styleUrls: ['./description.component.css']
})
export class DescriptionComponent implements OnInit {
public buy?:Buy;
  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const buyId = params.get("id");
      this.buy = buys.filter(buy => buy.id === buyId)[0];
    });
  }

}
