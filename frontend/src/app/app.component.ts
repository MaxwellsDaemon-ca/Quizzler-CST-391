import { Component, OnInit } from '@angular/core';
import { AuthService } from './services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent implements OnInit {
  title = 'Quizzler'; // Application title
  isLoggedIn: boolean = false; // Tracks if a user is logged in
  currentUser: any = null; // Holds the current user data

  constructor(private auth: AuthService, private router: Router) {}

  /**
   * Initializes the component and subscribes to the current user observable.
   * Updates login status and user information upon changes.
   */
  ngOnInit(): void {
    this.auth.currentUser.subscribe((user) => {
      this.currentUser = user;
      this.isLoggedIn = !!(user && user.token); // Sets login status based on the presence of a valid token
    });
  }

  /**
   * Logs out the user by clearing authentication data and navigating to the home page.
   */
  logout(): void {
    this.auth.logout();
    this.isLoggedIn = false;
    this.currentUser = null;
    this.router.navigate(['/']);
  }

  /**
   * Checks if the current user has the 'admin' role.
   * @returns {boolean} True if the user is an admin, false otherwise.
   */
  isAdmin(): boolean {
    return this.auth.hasRole('admin');
  }
}
