export interface User {
    userID: number;
    username: string;
    email: string;
    password: string;
    totalScore: number;
    role: 'admin' | 'user'
}