import { Component, OnInit } from '@angular/core';
import { QuizService } from '../../services/quiz.service';
import { Question } from '../../models/questions.model';
import { Category } from '../../models/categories.model';

@Component({
  selector: 'app-list-questions',
  templateUrl: './list-questions.component.html',
  styleUrls: ['./list-questions.component.css']
})
export class ListQuestionsComponent implements OnInit {
  questions: Question[] = [];
  categories: Category[] = [];

  constructor(private quizService: QuizService) {}

  ngOnInit(): void {
    this.fetchCategories();
    this.fetchQuestions();  // You can pass in categoryID or difficulty here as needed
  }

  // Fetch categories from the backend
  fetchCategories() {
    this.quizService.getCategories().subscribe((categories: Category[]) => {
      this.categories = categories;
    });
  }

  // Fetch questions based on query params
  fetchQuestions(categoryID?: number, difficulty?: string) {
    this.quizService.getQuestions(categoryID, difficulty).subscribe((questions: Question[]) => {
      this.questions = questions;
    });
  }

  // Helper to get category name based on categoryID
  getCategoryName(categoryID: number): string {
    const category = this.categories.find(cat => cat.categoryID === categoryID);
    return category ? category.category : 'Unknown Category';
  }
}
