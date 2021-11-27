import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutComponent } from './about.component';
import { AboutDetailsComponent } from './about-details/about-details.component';

const routes: Routes = [
  { path: '', component: AboutComponent },
  { path: ':id', component: AboutDetailsComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  declarations: [
    AboutDetailsComponent
  ]
})
export class AboutRoutingModule { }
