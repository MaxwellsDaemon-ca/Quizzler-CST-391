import { Component, OnInit } from '@angular/core';
import { QuizService } from '../../services/quiz.service';
import { Category } from '../../models/categories.model';

@Component({
  selector: 'app-list-categories',
  templateUrl: './list-categories.component.html',
  styleUrls: ['./list-categories.component.css']
})
export class ListCategoriesComponent implements OnInit {
  categories: Category[] = [];

  constructor(private quizService: QuizService) {}

  ngOnInit(): void {
    this.fetchCategories();
  }

  // Fetch categories from the backend
  fetchCategories() {
    this.quizService.getCategories().subscribe((categories: Category[]) => {
      this.categories = categories;
    });
  }
}
