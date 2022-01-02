import { Component, OnInit } from '@angular/core';

import { FavService } from "src/app/services/fav.service";

import { FavRentService } from 'src/app/services/fav-rent.service';
import { LocalStorageService } from "src/app/services/local-storage.service";
import { AuthService } from "src/app/services/auth.service";

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  currentUser: any;
  constructor(private favService: FavService,private favrentService: FavRentService,
    private localStorageService: LocalStorageService,
    public authService: AuthService
  ) {
    this.currentUser = this.localStorageService.get('user');
}
ngOnInit(): void {
  }
  logout() {
    this.authService.logout();
    this.ngOnInit();
    this.reloadPage();
    
    this.favService.clear();
    
    this.favrentService.clear();
  }
  reloadPage() {
    setTimeout(()=>{
      window.location.reload();
    }, 1);
  }
  clearFavourites() {
    this.favService.clear();
    this.ngOnInit();
  }
}
