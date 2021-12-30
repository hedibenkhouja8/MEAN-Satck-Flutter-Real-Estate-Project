import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutComponent } from './about.component';
import { AboutDetailsComponent } from './about-details/about-details.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
const routes: Routes = [
  { path: '', component: AboutComponent },
  { path: ':id', component: AboutDetailsComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes), 
    ReactiveFormsModule,
    FormsModule],
  exports: [RouterModule, ReactiveFormsModule,FormsModule],
  declarations: [
    AboutDetailsComponent
  ]
})
export class AboutRoutingModule { }
