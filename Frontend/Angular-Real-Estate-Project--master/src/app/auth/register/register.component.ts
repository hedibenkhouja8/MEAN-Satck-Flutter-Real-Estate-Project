import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup,Validators } from "@angular/forms";
import { Router } from '@angular/router';

import { AuthService } from "src/app/services/auth.service";

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  public registerForm: FormGroup;

  constructor(
    public formBuilder: FormBuilder,
    public authService: AuthService,
    public router: Router
  ) { this.registerForm= this.formBuilder.group({
    name: ['', Validators.required],
    email: ['', [Validators.email, Validators.required]],
    password: ['', [Validators.minLength(6), Validators.required]],
    confirm_password: ['', [Validators.minLength(6), Validators.required]],
  }, {validator: this.passwordMatchValidator('password', 'confirm_password')}
  )
   }

  ngOnInit(): void {
  }
  signupUser() {
    if(this.registerForm.valid) {
      this.authService.signup(this.registerForm.value).subscribe(res => {
        console.log(res);
        if(res.status == 201) {
          this.registerForm.reset();
          this.router.navigate(['/auth/login']);
        }
      },
      err => {
        if (err.code == 400) {
          this.registerForm.controls.email.setErrors({used: true});
        }
      });
    }}

  private passwordMatchValidator(password: string, confirm_password: string) {
    return (group: FormGroup) => {
      const passwordInput = group.controls[password];
      const confirmPasswordInput = group.controls[confirm_password];
      if (passwordInput.value !== confirmPasswordInput.value) {
        return confirmPasswordInput.setErrors({ NoPassswordMatch: true });
      }
    }
  }
}