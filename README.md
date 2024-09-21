# Quizzler - Trivia Quiz Game

## Overview
**Quizzler** is a web-based trivia quiz game where users can test their knowledge across various categories. The game randomly selects questions based on the user's chosen category and difficulty. Users can track their scores and compete on leaderboards for individual categories or overall.

## Features
- User registration and login with hashed passwords for security.
- Multiple categories of trivia, including Mythology, History, Science, and more.
- Randomized questions based on chosen categories and difficulty levels (Easy, Medium, Hard).
- Score tracking per category and overall leaderboard system.
- RESTful API for interaction with the trivia system (e.g., manage users, questions, and leaderboards).

## Technologies Used
- **Backend**: Node.js, Express.js, TypeScript
- **Database**: MySQL
- **Frontend**: Angular (eventually)
- **Authentication**: bcrypt for password hashing
- **API Testing**: Postman

## Installation

### Prerequisites
Before running the project, ensure you have the following installed:
- Node.js
- MySQL
- Postman (optional for testing API)
- Git

### Steps to Run Locally
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/quizzler.git
    ```
2. Install project dependencies:
    ```bash
    cd quizzler
    npm install
    ```

3. Set up the database:
    - Run the MySQL script to create the required tables and populate categories.
    - Find the SQL script in `/database/init.sql`.

4. Create a `.env` file in the root directory and add your database credentials:
    ```env
    DB_HOST=127.0.0.1
    DB_USER=root
    DB_PASSWORD=root
    DB_DATABASE=quizzler
    ```

5. Start the development server:
    ```bash
    npm run start
    ```

6. Access the application in your browser at:
    ```
    http://localhost:3000
    ```

### Running the Application with Nodemon
To continuously monitor the project during development, run:
```bash
npm run start:watch
