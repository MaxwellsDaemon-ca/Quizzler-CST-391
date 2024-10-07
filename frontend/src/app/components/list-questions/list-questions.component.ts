import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { QuizService } from '../../services/quiz.service';
import { Question } from '../../models/questions.model';
import { Category } from '../../models/categories.model';

@Component({
  selector: 'app-list-questions',
  templateUrl: './list-questions.component.html',
  styleUrls: [
    './list-questions.component.css',
    '../../global-styles/custom-scrollbars.css',
  ],
})
export class ListQuestionsComponent implements OnInit {
  // Input property to receive questions from the parent component
  @Input() questions: Question[] = [];

  // Output property to emit selected question to the parent component
  @Output() questionSelected = new EventEmitter<Question>();

  // Variable to store the currently selected question
  selectedQuestion: Question | null = null;

  // List of categories to display category names with questions
  categories: Category[] = [];

  constructor(private quizService: QuizService) {}

  // Lifecycle hook for initialization logic
  ngOnInit(): void {
    // Fetch the categories and questions when the component is initialized
    this.fetchCategories();
    this.fetchQuestions();
  }

  // Method to fetch all available categories from the QuizService
  fetchCategories() {
    this.quizService.getCategories().subscribe((categories: Category[]) => {
      this.categories = categories;
    });
  }

  // Method to fetch questions with optional filtering by category or difficulty
  fetchQuestions(category?: string, difficulty?: string) {
    this.quizService
      .getQuestions(category, difficulty)
      .subscribe((questions: Question[]) => {
        this.questions = questions;
      });
  }

  // Method to retrieve the category name based on the categoryID of the question
  getCategoryName(categoryID: number): string {
    const category = this.categories.find(
      (cat) => cat.categoryID === categoryID
    );
    return category ? category.category : 'Unknown Category';
  }

  // Method to handle the selection of a question and emit it to the parent component
  onSelectQuestion(question: Question) {
    this.selectedQuestion = question;
    this.questionSelected.emit(question);
  }
}
