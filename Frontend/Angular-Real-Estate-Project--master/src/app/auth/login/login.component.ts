import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from "@angular/forms";
import { Router } from '@angular/router';

import { AuthService } from "src/app/services/auth.service";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
public a : any;
  public loginForm: FormGroup;

  constructor(
    public formBuilder: FormBuilder,
    public authService: AuthService,
    public router: Router
  ) {
    this.loginForm= this.formBuilder.group({
      email: ['', [Validators.email, Validators.required]],
      password: ['', [Validators.minLength(6), Validators.required]],
    });
   }

  ngOnInit(): void {
    this.a=2;
  }

  loginUser() {
    this.authService.login(this.loginForm.value)
    if (this.loginForm.invalid) {
     this.a=1;
     console.log(this.a);
    }
  }
  reloadPage() {
    setTimeout(()=>{
      window.location.reload();
    }, 1);
  }
  
}