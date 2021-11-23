import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BuyComponent } from './buy.component';
import { DescriptionComponent } from './description/description.component';

const routes: Routes = [{ path: '', component: BuyComponent }
,
{ path: ':id', component: DescriptionComponent }
];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  declarations: [
    DescriptionComponent
  ]
})
export class BuyRoutingModule { }
