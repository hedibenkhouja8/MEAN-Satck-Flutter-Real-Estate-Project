import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FavouritesComponent } from './favourites.component';
import { FavouritesBuyComponent } from './favourites-buy/favourites-buy.component';

const routes: Routes = [{ path: '', component: FavouritesComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  declarations: [
    FavouritesBuyComponent
  ]
})
export class FavouritesRoutingModule { }
