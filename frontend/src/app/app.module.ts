import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { CategorySelectionComponent } from './category-selection/category-selection.component';
import { DifficultySelectionComponent } from './difficulty-selection/difficulty-selection.component';
import { QuizComponent } from './quiz/quiz.component';
import { QuizResultsComponent } from './quiz-results/quiz-results.component';
import { UserProfileComponent } from './user-profile/user-profile.component';
import { LeaderboardComponent } from './leaderboard/leaderboard.component';
import { AdminPanelComponent } from './admin-panel/admin-panel.component';
import { QuestionManagementComponent } from './question-management/question-management.component';
import { CategoryManagementComponent } from './category-management/category-management.component';
import { ListQuestionsComponent } from './list-questions/list-questions.component';
import { ListCategoriesComponent } from './list-categories/list-categories.component';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';
import { UnauthorizedComponent } from './unauthorized/unauthorized.component';
import { HeaderComponent } from './header/header.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    CategorySelectionComponent,
    DifficultySelectionComponent,
    QuizComponent,
    QuizResultsComponent,
    UserProfileComponent,
    LeaderboardComponent,
    AdminPanelComponent,
    QuestionManagementComponent,
    CategoryManagementComponent,
    ListQuestionsComponent,
    ListCategoriesComponent,
    LoginComponent,
    SignupComponent,
    UnauthorizedComponent,
    HeaderComponent,
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,
    FormsModule,
    HttpClientModule,
    AppRoutingModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
