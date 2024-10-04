import { OkPacket } from "mysql";
import { execute } from "../services/mysql.connector";
import { UserCategoryScore } from "../models/user_category_scores.model";
import { user_category_scoresQueries } from "../queries/user_category_scores.queries";

export const readScoresByUserAndCategory = async (userID: number, categoryID: number) => {
    const result = await execute<UserCategoryScore[]>(user_category_scoresQueries.readScoresByUserAndCategory, [userID, categoryID]);
    return result[0];
};

export const updateScoreByUserAndCategory = async (userID: number, categoryID: number, score: number) => {
    return execute<OkPacket>(user_category_scoresQueries.updateScoreByUserAndCategory, [score, userID, categoryID]);
};

export const createScoreByUserAndCategory = async (userID: number, categoryID: number, score: number) => {
    return execute<OkPacket>(user_category_scoresQueries.createScoreByUserAndCategory, [userID, categoryID, score]);
};