import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router } from '@angular/router';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private authService: AuthService, private router: Router) {}

  canActivate(route: ActivatedRouteSnapshot): boolean {
    const requiredRole = route.data['role'];
    if (this.authService.hasRole(requiredRole)) {
      return true;  // Allow access if user has the required role
    } else {
      this.router.navigate(['/unauthorized']);
      return false;
    }
  }


  // Additional method to check roles
  canActivateWithRole(role: string): boolean {
    if (this.authService.hasRole(role)) {
      return true;  // Allow access if the user has the required role
    } else {
      this.router.navigate(['/unauthorized']);  // Redirect to unauthorized page
      return false;
    }
  }
}
