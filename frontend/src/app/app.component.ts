import { Component, OnInit } from '@angular/core';
import { AuthService } from './services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent implements OnInit{
  title = 'Quizzler';
  isLoggedIn: boolean = false;
  currentUser: any = null;

  constructor(private auth: AuthService, private router: Router) {}

  ngOnInit(): void {
    this.auth.currentUser.subscribe(user => {
      this.currentUser = user;
      this.isLoggedIn = !!(user && user.token);
    });
  }

  logout(): void {
    this.auth.logout();
    this.isLoggedIn = false;
    this.currentUser = null;
    this.router.navigate(['/']);
  }

  isAdmin(): boolean {
    const adminStatus = this.auth.hasRole('admin');
    console.log('Is Admin:', adminStatus);
    return adminStatus;
  }
}
