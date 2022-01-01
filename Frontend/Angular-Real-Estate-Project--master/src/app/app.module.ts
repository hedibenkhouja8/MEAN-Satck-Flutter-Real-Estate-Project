
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule ,  HTTP_INTERCEPTORS } from "@angular/common/http";

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { NavbarComponent } from './navbar/navbar.component';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { FooterComponent } from './footer/footer.component';
import { AuthInterceptor } from "./auth.interceptor";
@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    FooterComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
