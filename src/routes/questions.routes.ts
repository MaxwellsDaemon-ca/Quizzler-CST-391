import { Router } from "express";
import * as QuestionsController from '../controllers/questions.controller';

const router = Router();

router.
    route('/api/questions').
    get(QuestionsController.readQuestions);

router.
    route('/api/questions/:search').
    get(QuestionsController.readQuestionsBySearchValue);

router.
    route('/api/questions').
    post(QuestionsController.createQuestion);

router.
    route('/api/questions').
    put(QuestionsController.updateQuestion);

router.
    route('/api/questions/:questionID').
    delete(QuestionsController.deleteQuestion);

export default router;