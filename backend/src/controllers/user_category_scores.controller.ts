import * as ResponseDao from '../dao/user_responses.dao';
import * as ScoreDao from '../dao/user_category_scores.dao';

export const updateCategoryScores = async () => {
    try {
        const userScores = await ResponseDao.readResponsesByCategory();

        for (const scoreData of userScores) {
            const { userID, categoryID, score } = scoreData;

            const existingScore = await ScoreDao.readScoresByUserAndCategory(userID, categoryID);

            if (existingScore) {
                await ScoreDao.updateScoreByUserAndCategory(userID, categoryID, score);
            } else {
                await ScoreDao.createScoreByUserAndCategory(userID, categoryID, score);
            }
        }

        return true;
    } catch (error) {
        console.error('[user_category_scores.controller][updateCategoryScores][Error]: ', error);
        return false;
    }
}