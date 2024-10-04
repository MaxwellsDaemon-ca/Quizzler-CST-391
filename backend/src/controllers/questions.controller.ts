import { Request, RequestHandler, Response } from 'express';
import * as QuestionDao from '../dao/questions.dao';
import { OkPacket } from 'mysql';


export const readQuestions: RequestHandler = async (req: Request, res: Response) => {
    try {
        let questions;
        const category = req.query.category as string;
        const difficulty = req.query.difficulty as string;

        if (category && difficulty) {
            questions = await QuestionDao.readQuestionsByCategoryAndDifficulty(category, difficulty);
        } else if (category) {
            questions = await QuestionDao.readQuestionsByCategory(category);
        } else if (difficulty) {
            questions = await QuestionDao.readQuestionsByDifficulty(difficulty);
        } else {
            let questionID = parseInt(req.query.questionID as string);

            console.log('questionID', questionID);
            if (Number.isNaN(questionID)) {
                questions = await QuestionDao.readQuestions();
            } else {
                questions = await QuestionDao.readQuestionsByQuestionID(questionID);
            }
            
        }

        res.status(200).json(questions);
    } catch (error) {
        console.error('[questions.controller][readQuestions][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when fetching questions',
        });
    }
};

export const readQuestionsBySearchValue: RequestHandler = async (req: Request, res: Response) => {
    try {
        console.log('search', req.params.search);
        const questions = await QuestionDao.readQuestionsBySearchValue('%' + req.params.search + '%');

        res.status(200).json(questions);
    } catch (error) {
        console.error('[questions.controller][readQuestionsBySearchValue][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when fetching questions by search value'
        });
    }
};

export const createQuestion: RequestHandler = async (req: Request, res: Response) => {
    try {
        const okp: OkPacket = await QuestionDao.createQuestions(req.body);

        console.log('req.body', req.body);
        console.log('question', okp);

        res.status(200).json(okp);
    } catch (error) {
        console.error('[questions.controller][createQuestion][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when creating the question',
        });
    }
};

export const updateQuestion: RequestHandler = async (req: Request, res: Response) => {
    try {
        const okp: OkPacket = await QuestionDao.updateQuestions(req.body);

        console.log('req.body', req.body);
        console.log('question', okp);

        res.status(200).json(okp);
    } catch (error) {
        console.error('[questions.controller][updateQuestion][Error]: ', error);
        return res.status(500).json({
            message: 'There was an error when updating the question',
        });
    }
};

export const deleteQuestion: RequestHandler = async (req: Request, res: Response) => {
    try {
        const questionID = parseInt(req.params.questionID as string);

        console.log('questionID', questionID);
        if (!Number.isNaN(questionID)) {
            const response = await QuestionDao.deleteQuestions(questionID);
            res.status(200).json(response);
        } else {
            throw new Error('Integer expected for questionID');
        }
    } catch (error) {
        console.error('[questions.controller][deleteQuestion][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when deleting the question',
        });
    }
};
