import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['../signup/signup.component.css'],
})
export class LoginComponent {
  username: string = '';
  password: string = '';
  errorMessage: string = '';

  constructor(private authService: AuthService, private router: Router) {}

  // Handles the login form submission
  login() {
    this.authService.login(this.username, this.password).subscribe({
      next: (data) => {
        this.router.navigate(['/home']); // Navigate to homepage on success
      },
      error: (err) => {
        this.errorMessage = 'Login failed. Please try again.';
      },
    });
  }

  forgotPassword() {
    alert('Forgot Password functionality coming soon!')
  }
}
