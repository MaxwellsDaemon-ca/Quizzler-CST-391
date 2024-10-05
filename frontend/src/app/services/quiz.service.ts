import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Question } from '../models/questions.model';
import { Category } from '../models/categories.model';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class QuizService {
  private apiUrl = 'http://localhost:3000/api';

  constructor(private http: HttpClient) {}

  // Get all questions or filter by category and/or difficulty
  getQuestions(category?: number, difficulty?: string): Observable<Question[]> {
    let params = new HttpParams();

    // Add categoryID as a query parameter if provided
    if (category !== undefined) {
      params = params.append('category', category);
    }

    // Add difficulty as a query parameter if provided
    if (difficulty) {
      params = params.append('difficulty', difficulty);
    }

    return this.http.get<Question[]>(`${this.apiUrl}/questions`, { params });
  }

  // Get all categories
  getCategories(): Observable<Category[]> {
    return this.http.get<Category[]>(`${this.apiUrl}/categories`);
  }
}
