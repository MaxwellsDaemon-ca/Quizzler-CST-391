import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-admin-panel',
  templateUrl: './admin-panel.component.html',
  styleUrls: ['./admin-panel.component.css'],
})
export class AdminPanelComponent implements OnInit {
  // Inject AuthService to check user role and Router to handle redirection
  constructor(private authService: AuthService, private router: Router) {}

  // Lifecycle hook that runs after component initialization
  ngOnInit(): void {
    // Check if the user has the 'admin' role; if not, redirect to the unauthorized page
    if (!this.authService.hasRole('admin')) {
      this.router.navigate(['/unauthorized']);
    }
  }
}
