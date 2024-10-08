import { AfterViewInit, Component, OnInit } from '@angular/core';
import { QuizService } from '../../services/quiz.service';
import { Category } from '../../models/categories.model';

// Declares the bootstrap object to be used for modals
declare var bootstrap: any;

@Component({
  selector: 'app-category-management',
  templateUrl: './category-management.component.html',
  styleUrls: [
    './category-management.component.css', // Specific styles for category management
    '../../global-styles/custom-dropdown.css', // Custom dropdown styles
    '../../global-styles/modal.css', // Custom modal styles
  ],
})
export class CategoryManagementComponent implements OnInit, AfterViewInit {
  // Class properties
  categories: Category[] = []; // Array to store fetched categories
  selectedCategory: Category | null = null; // Currently selected category
  newCategoryName: string = ''; // Name for a new category
  newCategoryDescription: string = ''; // Description for a new category

  constructor(private quizService: QuizService) {}

  // Initialize component and fetch categories when the component loads
  ngOnInit(): void {
    this.fetchCategories();
  }

  // After the view is initialized, get or create the bootstrap modal instance
  ngAfterViewInit(): void {
    const modalElement = document.getElementById('createCategoryModal');
    if (modalElement) {
      const modal = bootstrap.Modal.getOrCreateInstance(modalElement);
    }
  }

  // Fetches the list of categories from the QuizService
  fetchCategories() {
    this.quizService.getCategories().subscribe((categories: Category[]) => {
      this.categories = categories;
    });
  }

  // Selects a category from the list and copies its values to be edited
  onSelectCategory(category: Category) {
    this.selectedCategory = { ...category }; // Shallow copy of the selected category
  }

  // Updates the selected category using the QuizService
  updateCategory() {
    if (this.selectedCategory) {
      this.quizService.updateCategory(this.selectedCategory).subscribe(() => {
        this.fetchCategories(); // Refresh category list after updating
        this.selectedCategory = null; // Deselect the category
      });
    }
  }

  // Creates a new category with the given name and description
  createCategory() {
    const newCategory: Category = {
      categoryID: 0, // ID will be generated by the backend
      category: this.newCategoryName,
      description: this.newCategoryDescription,
    };

    this.quizService.createCategory(newCategory).subscribe(() => {
      this.fetchCategories(); // Refresh category list after creation
      this.newCategoryName = ''; // Clear the form
      this.newCategoryDescription = ''; // Clear the form
      this.closeCreateCategoryModal(); // Close the modal
    });
  }

  // Deletes the selected category using the QuizService
  deleteCategory() {
    if (this.selectedCategory) {
      this.quizService
        .deleteCategory(this.selectedCategory.categoryID)
        .subscribe(() => {
          this.fetchCategories(); // Refresh category list after deletion
          this.selectedCategory = null; // Deselect the category
        });
    }
  }

  // Opens the modal for creating a new category
  openCreateCategoryModal() {
    const modalElement = document.getElementById('createCategoryModal');
    if (modalElement) {
      const modal = new bootstrap.Modal(modalElement);
      modal.show(); // Show the modal
    }
  }

  // Closes the modal after creating a new category
  closeCreateCategoryModal() {
    const modalElement = document.getElementById('createCategoryModal');
    if (modalElement) {
      const modal = bootstrap.Modal.getInstance(modalElement);
      modal.hide(); // Hide the modal
    }
  }
}
