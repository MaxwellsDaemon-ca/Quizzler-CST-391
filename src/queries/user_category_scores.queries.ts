export const user_category_scoresQueries = {
    readScoresByUserAndCategory: `
        SELECT
            userCategoryScoreID AS scoreID, userID AS userID, categoryID AS categoryID, score AS score
        FROM quizzler.user_category_scores
        WHERE userID = ? AND categoryID = ?
    `,
    updateScoreByUserAndCategory: `
        UPDATE user_category_scores
        SET score = ?
        WHERE userID = ? AND categoryID = ?
    `,
    createScoreByUserAndCategory: `
        INSERT INTO user_category_scores (userID, categoryID, score)
        VALUES (?, ?, ?)
    `
}