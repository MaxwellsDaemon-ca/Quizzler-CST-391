export interface UserResponse {
    responseID: number,
    userID: number,
    questionID: number,
    userAnswer: string,
    isCorrect: boolean,
    difficulty: 'Easy' | 'Medium' | 'Hard',
    score: number
}