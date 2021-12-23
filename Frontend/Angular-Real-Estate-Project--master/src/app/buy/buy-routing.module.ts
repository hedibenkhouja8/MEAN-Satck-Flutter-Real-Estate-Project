import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BuyComponent } from './buy.component';
import { DescriptionComponent } from './description/description.component';
import { CommonModule } from '@angular/common';

const routes: Routes = [{ path: '', component: BuyComponent }
,
{ path: ':id', component: DescriptionComponent }
];


@NgModule({
  imports: [RouterModule.forChild(routes),CommonModule],
  exports: [RouterModule],
  declarations: [
    DescriptionComponent
  ]
})
export class BuyRoutingModule { }
