import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css'],
})
export class SignupComponent {
  username: string = '';
  email: string = '';
  password: string = '';
  confirmPassword: string = '';
  passwordMismatch: boolean = false;
  errorMessage: string = '';

  constructor(private authService: AuthService, private router: Router) {}

  signup() {

    this.passwordMismatch = false;
    this.errorMessage = '';


    if (this.password !== this.confirmPassword) {
      this.passwordMismatch = true;
      return;
    }


    this.authService.signup(this.username, this.email, this.password).subscribe({
      next: () => {
        this.router.navigate(['/login']);
      },
      error: (err) => {
        this.errorMessage = 'Signup failed. Please try again.';
      },
    });
  }
}
