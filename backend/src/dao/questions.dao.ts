import { OkPacket } from "mysql";
import { execute } from "../services/mysql.connector";
import { Question } from "../models/questions.model";
import { questionQueries } from "../queries/questions.queries";

export const readQuestions = async () => {
    return execute<Question[]>(questionQueries.readQuestions, []);
};

export const readQuestionsByQuestionID = async (questionID: number) => {
    return execute<Question[]>(questionQueries.readQuestionsByQuestionID, [questionID]);
};

export const readQuestionsByCategory = async (category: string) => {
    return execute<Question[]>(questionQueries.readQuestionsByCategory, [category]);
};

export const readQuestionsByDifficulty = async (difficulty: string) => {
    return execute<Question[]>(questionQueries.readQuestionsByDifficulty, [difficulty]);
};

export const readQuestionsByCategoryAndDifficulty = async (category: string, difficulty: string) => {
    return execute<Question[]>(questionQueries.readQuestionsByCategoryAndDifficulty, [category, difficulty]);
};

export const readQuestionsBySearchValue = async (search: string) => {
    return execute<Question[]>(questionQueries.readQuestionsBySearchValue, [search, search]);
};

export const createQuestions = async (question: Question) => {
    return execute<OkPacket>(questionQueries.createQuestions,
        [question.categoryID, question.questionText, question.difficulty,
         question.correctAnswer, JSON.stringify(question.options)]);
};

export const updateQuestions = async (question: Question) => {
    return execute<OkPacket>(questionQueries.updateQuestions,
        [question.categoryID, question.questionText, question.difficulty,
         question.correctAnswer, JSON.stringify(question.options), question.questionID]);
};

export const deleteQuestions = async (questionID: number) => {
    return execute<OkPacket>(questionQueries.deleteQuestions, [questionID]);
};