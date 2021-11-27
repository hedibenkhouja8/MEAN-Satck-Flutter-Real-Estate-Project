import { Component, OnInit } from '@angular/core';
import { Agencys } from '../about-list';
import { Agency } from '../about.model';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

   public agencyList: Agency[] = Agencys;

  constructor() { }

  ngOnInit(): void {
  }

}
