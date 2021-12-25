import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Agency } from 'src/app/about.model';
import { Agencys } from 'src/app/about-list';

import { AboutService } from '../../services/about.service';
@Component({
  selector: 'app-about-details',
  templateUrl: './about-details.component.html',
  styleUrls: ['./about-details.component.css']
})
export class AboutDetailsComponent implements OnInit {
  public agency?:Agency;
  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const agencyId = params.get("id");
      this.agency = Agencys.filter(agency => agency.id === agencyId)[0];
  });

/**
 * ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const agencyId = params.get("id");
      this.aboutService.get(agencyId).subscribe((agency) => (this.agency=agency));
  });
 */

}
}
