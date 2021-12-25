import { Component, OnInit } from '@angular/core';
import { Agencys } from '../about-list';
import { Agency } from '../about.model';

import { AboutService } from '../services/about.service';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

   public agencyList: any =[];

  constructor(
    private aboutService: AboutService
  ) { }

  ngOnInit(): void {
    this.aboutService.all().subscribe((res) => (this.agencyList = res));;
  }

}
