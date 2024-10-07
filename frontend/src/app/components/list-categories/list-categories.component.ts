import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { QuizService } from '../../services/quiz.service';
import { Category } from '../../models/categories.model';

@Component({
  selector: 'app-list-categories',
  templateUrl: './list-categories.component.html',
  styleUrls: [
    './list-categories.component.css',
    '../../global-styles/custom-scrollbars.css', // Custom scrollbars style
  ],
})
export class ListCategoriesComponent implements OnInit {
  // Input: Receives a list of categories to be displayed
  @Input() categories: Category[] = [];

  // Output: Emits an event when a category is selected
  @Output() categorySelected = new EventEmitter<Category>();

  // Stores the currently selected category
  selectedCategory: Category | null = null;

  // Injects the QuizService for fetching category data
  constructor(private quizService: QuizService) {}

  // Lifecycle hook: Initializes the component and fetches categories
  ngOnInit(): void {
    this.fetchCategories();
  }

  // Fetches categories from the QuizService and assigns them to the categories array
  fetchCategories() {
    this.quizService.getCategories().subscribe((categories: Category[]) => {
      this.categories = categories;
    });
  }

  // Selects a category and emits the selection event to the parent component
  selectCategory(category: Category) {
    this.selectedCategory = category;
    this.categorySelected.emit(category);
  }
}
