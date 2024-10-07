import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class AuthService {
  private apiUrl = 'http://localhost:3000/api/users'; // Backend API URL for user-related endpoints
  private currentUserSubject: BehaviorSubject<any>; // Stores the current user information
  public currentUser: Observable<any>; // Observable to track user state across the app

  constructor(private http: HttpClient) {
    // Initializes currentUserSubject with value from localStorage or empty object if no user is logged in
    this.currentUserSubject = new BehaviorSubject<any>(
      JSON.parse(localStorage.getItem('currentUser') || '{}')
    );
    this.currentUser = this.currentUserSubject.asObservable();
  }

  /**
   * Returns the currently logged-in user's value
   */
  public get currentUserValue(): any {
    return this.currentUserSubject.value;
  }

  // ------------------------------
  // AUTHENTICATION FUNCTIONS
  // ------------------------------

  /**
   * Handles user login by sending username and password to the backend.
   * Stores the user and token information in localStorage upon success.
   */
  login(username: string, password: string): Observable<any> {
    return this.http
      .post<any>(`${this.apiUrl}/login`, { username, password })
      .pipe(
        map((user) => {
          console.log('User logged in:', user);

          // Stores the user information and JWT token in localStorage
          localStorage.setItem('currentUser', JSON.stringify(user));
          this.currentUserSubject.next(user); // Updates currentUserSubject
          return user;
        })
      );
  }

  /**
   * Checks whether a user is currently authenticated (i.e., has a valid token).
   */
  isAuthenticated(): boolean {
    const user = this.currentUserValue;
    return !!(user && user.token); // Returns true if the user object exists and has a token
  }

  /**
   * Logs out the current user by clearing localStorage and resetting the currentUserSubject.
   */
  logout(): void {
    localStorage.removeItem('currentUser'); // Removes user info from localStorage
    this.currentUserSubject.next(null); // Resets currentUserSubject to null
  }

  // ------------------------------
  // AUTHORIZATION FUNCTIONS
  // ------------------------------

  /**
   * Checks if the current user has a specific role (e.g., 'admin').
   */
  hasRole(role: string): boolean {
    const user = this.currentUserValue;
    return user && user.role === role; // Compares the user's role with the provided role
  }

  // ------------------------------
  // SIGNUP & TOKEN FUNCTIONS
  // ------------------------------

  /**
   * Handles user signup by sending the username, email, and password to the backend.
   */
  signup(username: string, email: string, password: string): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/signup`, {
      username,
      email,
      password,
    });
  }

  /**
   * Retrieves the stored token of the current user, if available.
   */
  getToken(): string | null {
    const user = this.currentUserValue;
    return user ? user.token : null; // Returns the token if the user is logged in, null otherwise
  }
}
