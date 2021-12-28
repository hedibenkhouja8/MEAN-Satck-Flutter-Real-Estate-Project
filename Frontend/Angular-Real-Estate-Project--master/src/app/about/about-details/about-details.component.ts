import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Agency } from 'src/app/about.model';
import { Agencys } from 'src/app/about-list';

import { AboutService } from './../../../app/services/about.service';
@Component({
  selector: 'app-about-details',
  templateUrl: './about-details.component.html',
  styleUrls: ['./about-details.component.css']
})
export class AboutDetailsComponent implements OnInit {
  // public agency?:Agency;
  id = this.route.snapshot.params['id'];
  list: any;
  about = {
    owner: '',
    mail: '',
    phone: '',
    image_owner: '',
    location: '',
    image_location: '',
    description: '',
    siege_social: '',
    date_creation: '',
    horaire: ''
  };
  constructor(private route: ActivatedRoute ,private aboutService:AboutService) { }

  ngOnInit(): void {
   /* this.route.paramMap.subscribe(params => {
      const agencyId = params.get("id");
      this.agency = Agencys.filter(agency => agency.id === agencyId)[0];
  });*/

  this.aboutService.get(this.id).subscribe((data) => {
    this.list = data;
    this.about = this.list;
  });
}
}
