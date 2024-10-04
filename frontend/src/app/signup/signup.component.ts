import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css'],
})
export class SignupComponent {
  username: string = '';
  email: string = '';
  password: string = '';
  errorMessage: string = '';

  constructor(private authService: AuthService, private router: Router) {}

  // Handles the signup form submission
  signup() {
    this.authService.signup(this.username, this.email, this.password).subscribe({
      next: (data) => {
        this.router.navigate(['/login']); // Navigate to login on success
      },
      error: (err) => {
        this.errorMessage = 'Signup failed. Please try again.';
      },
    });
  }
}
