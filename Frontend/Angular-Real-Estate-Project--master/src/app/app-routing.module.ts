import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ContactusComponent } from "./contactus/contactus.component";
import { HomeComponent } from "./home/home.component";
import { ServicesComponent } from "./services/services.component";
import { NotFoundComponent } from './not-found/not-found.component';
import { FeedbackComponent } from './feedback/feedback.component';
import{ RentComponent} from './rent/rent.component';
import { DescriptionComponent } from './buy/description/description.component';

const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'contactus', component: ContactusComponent},
  { path: '', component: HomeComponent},
  {path: 'services', component: ServicesComponent},
  { path: 'rent', component: RentComponent},
  {path: 'feedback', component: FeedbackComponent},
  //{path: 'buy/description', component: DescriptionComponent},
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'buy', loadChildren: () => import('./buy/buy.module').then(m => m.BuyModule) },
  { path: 'login', loadChildren: () => import('./login/login.module').then(m => m.LoginModule) },
  { path: 'users', loadChildren: () => import('./users/users.module').then(m => m.UsersModule) },
  { path: 'rent', loadChildren: () => import('./rent/rent.module').then(m => m.RentModule) },
  { path: 'about', loadChildren: () => import('./about/about.module').then(m => m.AboutModule) },
  { path: 'favourites', loadChildren: () => import('./favourites/favourites.module').then(m => m.FavouritesModule) },
  {path: '**', component: NotFoundComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  declarations: [
    ContactusComponent,
    ServicesComponent,
    NotFoundComponent,
    FeedbackComponent,
  ]
})
export class AppRoutingModule { }
