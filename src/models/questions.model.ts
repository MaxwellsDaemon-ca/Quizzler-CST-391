export interface questions {
    questionID: number;
    categoryID: number;
    questionText: string;
    difficulty: 'easy' | 'medium' | 'hard';
    correctAnswer: string;
    options: string[];    
}
