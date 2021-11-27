import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RentComponent } from './rent.component';
import { RentDetailsComponent } from './rent-details/rent-details.component';

const routes: Routes = [
  { path: '', component: RentComponent },
{ path: ':id', component: RentDetailsComponent }];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  declarations: [
    RentDetailsComponent
  ]
})
export class RentRoutingModule { }
