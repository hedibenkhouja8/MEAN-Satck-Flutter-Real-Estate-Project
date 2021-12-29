import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BuyRoutingModule } from './buy-routing.module';
import { BuyComponent } from './buy.component';
import { DescriptionComponent } from './description/description.component';

import { ReactiveFormsModule, FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    BuyComponent
  ],
  imports: [
    CommonModule,
    BuyRoutingModule,
    ReactiveFormsModule,
    FormsModule
  ]
})
export class BuyModule { }
