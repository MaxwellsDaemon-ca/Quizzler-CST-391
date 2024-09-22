export const user_responseQueries = {
    readResponses: `
        SELECT
            responseID AS responseID, userID AS userID, questionID AS questionID,
            userAnswer AS userAnswer, isCorrect as isCorrect, difficulty AS difficulty,
            scoreEarned AS score
        FROM quizzler.user_responses
    `,
    readResponsesByCategory: `
        SELECT 
            ur.userID AS userID, q.categoryID AS categoryID, SUM(ur.scoreEarned) AS score
        FROM quizzler.user_responses ur
        JOIN quizzler.questions q ON ur.questionID = q.questionID
        GROUP BY ur.userID, q.categoryID
    `,
    createUserResponse: `
        INSERT INTO user_responses (userID, questionID, userAnswer, isCorrect, difficulty, scoreEarned)
        VALUES (?, ?, ?, ?, ?, ?)
    `
}