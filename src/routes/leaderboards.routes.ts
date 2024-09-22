import { Router } from "express";
import * as LeaderboardController from '../controllers/leaderboards.controller';

const router = Router();

router.
    route('/api/leaderboards').
    get(LeaderboardController.readLeaderboards);

router.
    route('/api/leaderboards/global').
    get(LeaderboardController.readGlobalLeaderboard);

export default router;