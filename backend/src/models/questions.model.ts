export interface Question {
    questionID: number;
    categoryID: number;
    questionText: string;
    difficulty: 'Easy' | 'Medium' | 'Hard';
    correctAnswer: string;
    options: string[];    
}
