import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Question } from '../models/questions.model';
import { Category } from '../models/categories.model';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class QuizService {
  private apiUrl = 'http://localhost:3000/api'; // Base URL for API requests

  constructor(private http: HttpClient) {}

  // ------------------------------
  // QUESTION CRUD OPERATIONS
  // ------------------------------

  /**
   * Fetches a list of questions, optionally filtering by category and/or difficulty.
   * @param category The category to filter by (optional)
   * @param difficulty The difficulty level to filter by (optional)
   */
  getQuestions(category?: string, difficulty?: string): Observable<Question[]> {
    let params = new HttpParams();

    if (category !== undefined) {
      params = params.append('category', category);
    }

    if (difficulty) {
      params = params.append('difficulty', difficulty);
    }

    return this.http.get<Question[]>(`${this.apiUrl}/questions`, { params });
  }

  /**
   * Searches for questions based on a search value.
   * @param searchValue The value to search for in questions
   */
  getQuestionsBySearch(searchValue: string): Observable<Question[]> {
    return this.http.get<Question[]>(`${this.apiUrl}/questions/${searchValue}`);
  }

  /**
   * Creates a new question.
   * @param question The new question to create
   */
  createQuestion(question: Question): Observable<void> {
    return this.http.post<void>(`${this.apiUrl}/questions`, question);
  }

  /**
   * Updates an existing question.
   * @param question The question to update
   */
  updateQuestion(question: Question): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/questions`, question);
  }

  /**
   * Deletes a question based on its ID.
   * @param questionID The ID of the question to delete
   */
  deleteQuestion(questionID: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/questions/${questionID}`);
  }

  // ------------------------------
  // CATEGORY CRUD OPERATIONS
  // ------------------------------

  /**
   * Fetches a list of all categories.
   */
  getCategories(): Observable<Category[]> {
    return this.http.get<Category[]>(`${this.apiUrl}/categories`);
  }

  /**
   * Creates a new category.
   * @param category The new category to create
   */
  createCategory(category: Category): Observable<void> {
    return this.http.post<void>(`${this.apiUrl}/categories`, category);
  }

  /**
   * Updates an existing category.
   * @param category The category to update
   */
  updateCategory(category: Category): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/categories`, category);
  }

  /**
   * Deletes a category based on its ID.
   * @param categoryID The ID of the category to delete
   */
  deleteCategory(categoryID: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/categories/${categoryID}`);
  }
}
