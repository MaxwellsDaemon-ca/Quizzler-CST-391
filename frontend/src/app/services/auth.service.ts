import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class AuthService {
  private apiUrl = 'http://localhost:3000/api/users';
  private currentUserSubject: BehaviorSubject<any>;
  public currentUser: Observable<any>;

  constructor(private http: HttpClient) {
    // Get the current user (including token) from localStorage
    this.currentUserSubject = new BehaviorSubject<any>(JSON.parse(localStorage.getItem('currentUser') || '{}'));
    this.currentUser = this.currentUserSubject.asObservable();
  }

  public get currentUserValue(): any {
    return this.currentUserSubject.value;
  }

  // Method to log in a user
  login(username: string, password: string) {
    return this.http.post<any>(`${this.apiUrl}/login`, { username, password })
      .pipe(map(user => {
        // Check if the user object contains the role
        console.log('User logged in:', user);

        // Store user details, including role and token
        localStorage.setItem('currentUser', JSON.stringify(user));
        this.currentUserSubject.next(user);
        return user;
      }));
  }


  // Method to check if the user is authenticated based on the existence of a valid token
  isAuthenticated(): boolean {
    const user = this.currentUserValue;
    return !!(user && user.token); // Check if user object and token exist
  }

  // Method to log out a user and remove them from localStorage
  logout(): void {
    localStorage.removeItem('currentUser');
    this.currentUserSubject.next(null);
  }

  // Method to check if the current user has a specific role
  hasRole(role: string): boolean {
    const user = this.currentUserValue;
    console.log('Current User Role: ', user?.role);
    return user && user.role === role;
  }

  // Method for user signup
  signup(username: string, email: string, password: string): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/signup`, { username, email, password });
  }

  // Utility to get the token directly if needed
  getToken(): string | null {
    const user = this.currentUserValue;
    return user ? user.token : null; // Return the token from currentUser
  }
}
