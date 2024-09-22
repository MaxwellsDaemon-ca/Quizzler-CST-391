import { Request, RequestHandler, Response } from "express";
import { updateCategoryScores } from './user_category_scores.controller';
import * as LeaderboardDao from '../dao/leaderboards.dao';

const updateScoreValues = async () => {
    return updateCategoryScores();
};

export const readGlobalLeaderboard: RequestHandler = async (req: Request, res: Response) => {
    try {
        if (!updateScoreValues()){
            throw new Error('Error updating category scores');
        }

        let leaderboards = await LeaderboardDao.readOverallLeaderboard();

        res.status(200).json(leaderboards);
    } catch (error) {
        console.error('[leaderboards.controller][readGlobalLeaderboard][Error]: ', error);
        res.status(500).json({
            message: 'There was an error fetching leaderboards'
        });
    }
};

export const readLeaderboards: RequestHandler = async (req: Request, res: Response) => {
    try {

        if (!updateScoreValues()){
            throw new Error('Error updating category scores');
        }

        let leaderboards;
        const username = req.query.username as string;
        const category = req.query.category as string;

        if (username && category) {
            throw new Error('Either username OR category expected');
        }
        else if (username) {
            leaderboards = await LeaderboardDao.readLeaderboardsByUsername(username);
        } else if (category) {
            leaderboards = await LeaderboardDao.readLeaderboardByCategory(category);
        } else {
            leaderboards = await LeaderboardDao.readLeaderboards();
        }

        res.status(200).json(leaderboards);
    } catch (error) {
        console.error('[leaderboards.controller][readLeaderboards][Error]: ', error);
        res.status(500).json({
            message: 'There was an error fetching leaderboards'
        });
    }
};