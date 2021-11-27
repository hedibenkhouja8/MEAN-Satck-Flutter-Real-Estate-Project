import { Component, OnInit } from '@angular/core';
import { rents } from '../rent-list';
import { Rent } from '../rent.model';

@Component({
  selector: 'app-rent',
  templateUrl: './rent.component.html',
  styleUrls: ['./rent.component.css']
})
export class RentComponent implements OnInit {
  public rentList: Rent[] = rents;

  constructor() { }

  ngOnInit(): void {
  }

}
