export const questionQueries = {
    readQuestions: `
        SELECT
            questionID AS questionID, categoryID AS categoryID, difficulty AS difficulty,
            questionText AS questionText, correctAnswer AS correctAnswer, options AS options
        FROM quizzler.questions
    `,
    readQuestionsByQuestionID: `
        SELECT
            questionID AS questionID, categoryID AS categoryID, difficulty AS difficulty,
            questionText AS questionText, correctAnswer AS correctAnswer, options AS options
        FROM quizzler.questions
        WHERE quizzler.questions.questionID = ?
    `,
    readQuestionsByCategory: `
        SELECT
            q.questionID AS questionID, q.categoryID AS categoryID, q.difficulty AS difficulty,
            q.questionText AS questionText, q.correctAnswer AS correctAnswer, q.options AS options
        FROM quizzler.questions q
        JOIN quizzler.categories c ON q.categoryID = c.categoryID
        WHERE c.categoryName = ?
    `,
    readQuestionsByDifficulty:  `
        SELECT
            questionID AS questionID, categoryID AS categoryID, difficulty AS difficulty,
            questionText AS questionText, correctAnswer AS correctAnswer, options AS options
        FROM quizzler.questions
        WHERE quizzler.questions.difficulty = ?
    `,
    readQuestionsByCategoryAndDifficulty: `
        SELECT
            q.questionID AS questionID, q.categoryID AS categoryID, q.difficulty AS difficulty,
            q.questionText AS questionText, q.correctAnswer AS correctAnswer, q.options AS options
        FROM quizzler.questions q
        JOIN quizzler.categories c ON q.categoryID = c.categoryID
        WHERE c.categoryName = ? AND q.difficulty = ?
    `,
    readQuestionsBySearchValue: `
        SELECT
            questionID AS questionID, categoryID AS categoryID, difficulty AS difficulty,
            questionText AS questionText, correctAnswer AS correctAnswer, options AS options
        FROM quizzler.questions
        WHERE 
            quizzler.questions.questionText LIKE ?
            OR
            quizzler.questions.options LIKE ?
    `,
    createQuestions: `
        INSERT INTO questions(categoryID, questionText, difficulty, correctAnswer, options)
        VALUES (?, ?, ?, ?, ?)
    `,
    updateQuestions: `
        UPDATE quizzler.questions
            SET 
                categoryID = ?, questionText = ?, difficulty = ?,
                correctAnswer = ?, options = ?
        WHERE quizzler.questions.questionID = ?
    `,
    deleteQuestions: `
        DELETE FROM quizzler.questions
        WHERE quizzler.questions.questionID = ?
    `
}