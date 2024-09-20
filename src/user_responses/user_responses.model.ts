export interface UserResponse {
    responseID: number;
    userID: number;
    questionID: number;
    selectedAnswer: string;
    isCorrect: boolean;
    difficulty: 'easy' | 'medium' | 'hard';
    scoreEarned: number;
}