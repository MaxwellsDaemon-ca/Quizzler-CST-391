import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { CategorySelectionComponent } from './components/category-selection/category-selection.component';
import { DifficultySelectionComponent } from './components/difficulty-selection/difficulty-selection.component';
import { QuizComponent } from './components/quiz/quiz.component';
import { QuizResultsComponent } from './components/quiz-results/quiz-results.component';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { LeaderboardComponent } from './components/leaderboard/leaderboard.component';
import { AdminPanelComponent } from './components/admin-panel/admin-panel.component';
import { QuestionManagementComponent } from './components/question-management/question-management.component';
import { CategoryManagementComponent } from './components/category-management/category-management.component';
import { ListQuestionsComponent } from './components/list-questions/list-questions.component';
import { ListCategoriesComponent } from './components/list-categories/list-categories.component';
import { LoginComponent } from './components/login/login.component';
import { SignupComponent } from './components/signup/signup.component';
import { UnauthorizedComponent } from './components/unauthorized/unauthorized.component';
import { HeaderComponent } from './components/header/header.component';


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
