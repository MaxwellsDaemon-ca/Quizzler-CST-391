import { AfterViewInit, Component, OnInit } from '@angular/core';
import { QuizService } from '../../services/quiz.service';
import { Question } from '../../models/questions.model';
import { Category } from '../../models/categories.model';

declare var bootstrap: any;

@Component({
  selector: 'app-question-management',
  templateUrl: './question-management.component.html',
  styleUrls: [
    './question-management.component.css',
    '../../global-styles/custom-dropdown.css',
    '../../global-styles/modal.css',
  ],
})
export class QuestionManagementComponent implements OnInit, AfterViewInit {
  // Variables related to questions
  selectedQuestion: Question | null = null;
  questions: Question[] = [];
  filteredQuestions: Question[] = [];
  optionsText: string = ''; // Text area for question options

  // Variables related to categories
  categories: Category[] = [];
  selectedCategory: string = '';

  // Filtering and form input variables
  searchValue: string = '';
  selectedDifficulty: string = '';
  isFiltered: boolean = false;

  // Variables for new question creation
  newQuestion: Question = {
    questionID: 0,
    categoryID: 0,
    questionText: '',
    difficulty: 'Easy',
    correctAnswer: '',
    options: [],
  };
  newQuestionDiff: string = '';
  newQuestionOptions: string = '';
  newQuestionCategory: string = '';

  // Dropdown control variables
  dropdownOpen: boolean = false;
  dropdownOpenDifficulty: boolean = false;

  constructor(private quizService: QuizService) {}

  // ---------------------- LIFECYCLE METHODS ----------------------

  ngOnInit(): void {
    this.fetchQuestions(); // Fetch all questions
    this.fetchCategories(); // Fetch all categories
  }

  ngAfterViewInit(): void {
    this.initializeTooltips();
    this.initializeModal();
  }

  // ---------------------- QUESTION MANAGEMENT ----------------------

  /**
   * Fetch all questions from the server.
   */
  fetchQuestions(): void {
    this.quizService.getQuestions().subscribe((questions) => {
      this.questions = questions;
    });
  }

  /**
   * Handle question selection from the list.
   * Sets the selected question and parses its options for display.
   * @param question - the question selected
   */
  onQuestionSelected(question: Question): void {
    this.selectedQuestion = { ...question };

    // Parse options if stored as a string
    if (typeof this.selectedQuestion.options === 'string') {
      try {
        this.selectedQuestion.options = JSON.parse(
          this.selectedQuestion.options
        );
      } catch (error) {
        console.error('Error parsing options: ', error);
      }
    }

    // Convert options array into newline-separated string for text area
    this.optionsText = this.selectedQuestion.options.join('\n');
  }

  /**
   * Create a new question based on the form inputs.
   */
  createQuestion(): void {
    console.log('Currently in: ', 'createQuestion()');

    // Split options by newline and trim spaces
    this.newQuestion.options = this.newQuestionOptions
      .split('\n')
      .map((opt) => opt.trim());

    // Set category ID based on selected category
    this.newQuestion.categoryID = this.getCategoryID(this.newQuestionCategory);

    // Send request to create the question
    this.quizService.createQuestion(this.newQuestion).subscribe(() => {
      this.fetchQuestions(); // Refresh question list after creation
      this.closeCreateQuestionModal(); // Close modal after question creation
      this.resetModalForm(); // Reset modal form
    });
  }

  /**
   * Edit the currently selected question.
   */
  editQuestion(): void {
    if (this.selectedQuestion) {
      // Update options from text area input
      this.selectedQuestion.options = this.optionsText
        .split('\n')
        .map((opt) => opt.trim());

      // Send update request for the selected question
      this.quizService.updateQuestion(this.selectedQuestion).subscribe(() => {
        this.fetchQuestions(); // Refresh question list after edit
        this.selectedQuestion = null; // Clear selection after update
      });
    }
  }

  /**
   * Delete a question by ID.
   * @param questionID - the ID of the question to delete
   */
  deleteQuestion(questionID: number): void {
    this.quizService.deleteQuestion(questionID).subscribe(() => {
      this.fetchQuestions(); // Refresh question list after deletion
    });
    this.selectedQuestion = null; // Clear selection after deletion
  }

  // ---------------------- CATEGORY MANAGEMENT ----------------------

  /**
   * Fetch all categories from the server, excluding "General Knowledge".
   */
  fetchCategories(): void {
    this.quizService.getCategories().subscribe((categories) => {
      this.categories = categories.filter(
        (category) => category.category !== 'General Knowledge'
      );
    });
  }

  /**
   * Get the category ID based on its name.
   * @param categoryName - the name of the category
   * @returns the category ID
   */
  getCategoryID(categoryName: string): number {
    const foundCategory = this.categories.find(
      (category) => category.category === categoryName
    );
    if (!foundCategory) {
      throw new Error(`Category '${categoryName}' not found`);
    }
    return foundCategory.categoryID;
  }

  // ---------------------- SEARCH AND FILTERING ----------------------

  /**
   * Handle search input changes.
   * @param event - the search input event
   */
  onSearch(event: any): void {
    this.searchValue = event.target.value;
    this.loadQuestions(); // Reload the questions based on search/filter criteria
  }

  /**
   * Load questions based on search/filter criteria.
   */
  loadQuestions(): void {
    // If search value exists, fetch questions by search text
    if (this.searchValue) {
      this.quizService
        .getQuestionsBySearch(this.searchValue)
        .subscribe((questions) => {
          this.filteredQuestions = questions;
          this.selectedDifficulty = '';
          this.selectedCategory = '';
        });
      this.isFiltered = true;
      return;
    }

    // Otherwise, fetch based on selected category and difficulty
    const category = this.selectedCategory || undefined;
    const difficulty = this.selectedDifficulty || undefined;

    this.quizService
      .getQuestions(category, difficulty)
      .subscribe((questions) => {
        this.filteredQuestions = questions;
      });
    this.isFiltered = true;
  }

  /**
   * Select a category and clear the search input.
   * @param categoryName - the name of the category selected
   * @param searchInput - the search input element
   */
  selectCategory(categoryName: string, searchInput: HTMLInputElement): void {
    this.selectedCategory = categoryName;
    this.searchValue = '';
    searchInput.value = '';
    this.dropdownOpen = false;
    this.loadQuestions(); // Reload questions after category selection
  }

  /**
   * Select a difficulty and clear the search input.
   * @param difficulty - the difficulty level selected
   * @param searchInput - the search input element
   */
  selectDifficulty(difficulty: string, searchInput: HTMLInputElement): void {
    this.selectedDifficulty = difficulty;
    this.searchValue = '';
    searchInput.value = '';
    this.dropdownOpenDifficulty = false;
    this.loadQuestions(); // Reload questions after difficulty selection
  }

  // ---------------------- MODAL HANDLING ----------------------

  /**
   * Initialize modal for creating a new question
   */
  initializeModal(): void {
    const modalElement = document.getElementById('createQuestionModal');
    if (modalElement) {
      bootstrap.Modal.getOrCreateInstance(modalElement);
    }
  }

  /**
   * Open the modal for creating a new question.
   */
  openCreateQuestionModal(): void {
    const modalElement = document.getElementById('createQuestionModal');
    if (modalElement) {
      const modal = new bootstrap.Modal(modalElement);
      modal.show();
    }
  }

  /**
   * Close the modal for creating a new question.
   */
  closeCreateQuestionModal(): void {
    const modalElement = document.getElementById('createQuestionModal');
    if (modalElement) {
      const modal = bootstrap.Modal.getInstance(modalElement);
      modal.hide();
    }
  }

  /**
   * Reset form inputs in the create question modal.
   */
  resetModalForm(): void {
    this.newQuestion = {
      questionID: 0,
      categoryID: 0,
      questionText: '',
      difficulty: 'Easy',
      correctAnswer: '',
      options: [],
    };
    this.newQuestionCategory = '';
    this.newQuestionDiff = '';
    this.newQuestionOptions = '';
  }

  // ---------------------- DROPDOWN CONTROLS ----------------------

  /**
   * Toggle category dropdown visibility.
   */
  toggleDropdown(): void {
    this.dropdownOpen = !this.dropdownOpen;
  }

  /**
   * Handle selection of a new question category from the dropdown.
   * @param categoryName - the selected category name
   */
  newQuestionCategorySelection(categoryName: string): void {
    this.newQuestionCategory = categoryName;
    this.dropdownOpen = false;
  }

  /**
   * Toggle difficulty dropdown visibility.
   */
  toggleDropdownDifficulty(): void {
    this.dropdownOpenDifficulty = !this.dropdownOpenDifficulty;
  }

  /**
   * Handle difficulty selection for new questions.
   * @param difficulty - the selected difficulty level
   */
  newQuestionDifficultySelection(difficulty: string): void {
    this.newQuestion.difficulty =
      difficulty === '' ? 'Easy' : (difficulty as 'Easy' | 'Medium' | 'Hard');
    this.dropdownOpenDifficulty = false;
    this.newQuestionDiff = difficulty;
  }

  // ---------------------- TOOLTIP INITIALIZATION ----------------------

  /**
   * Initialize tooltips for UI elements.
   */
  initializeTooltips(): void {
    const tooltipTriggerList = [].slice.call(
      document.querySelectorAll('[data-bs-toggle="tooltip"]')
    );
    tooltipTriggerList.map(function (tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl, {
        delay: { show: 0, hide: 10000 },
      });
    });
  }
}
