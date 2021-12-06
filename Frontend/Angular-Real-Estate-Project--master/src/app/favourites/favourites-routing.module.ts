import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FavouritesComponent } from './favourites.component';
import { FavouritesBuyComponent } from './favourites-buy/favourites-buy.component';
import { FavouritesRentComponent } from './favourites-rent/favourites-rent.component';
import { CommonModule } from '@angular/common';

const routes: Routes = [
  { path: '', component: FavouritesComponent },
  { path: 'buy-favourites', component: FavouritesBuyComponent },
  { path: 'rent-favourites', component: FavouritesRentComponent }
  ];

@NgModule({
  imports: [RouterModule.forChild(routes),CommonModule],
  exports: [RouterModule],
  declarations: [
    FavouritesBuyComponent,
    FavouritesRentComponent
  ]
})
export class FavouritesRoutingModule { }
