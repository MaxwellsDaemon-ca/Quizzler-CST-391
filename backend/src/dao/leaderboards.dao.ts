import { execute } from "../services/mysql.connector";
import { leaderboardQueries } from "../queries/leaderboards.queries";
import { OkPacket } from "mysql";

export const readLeaderboards = async () => {
    return execute<any[]>(leaderboardQueries.readLeaderboards, []);
};

export const readLeaderboardsByUsername = async(username: string) => {
    return execute<any[]>(leaderboardQueries.readLeaderboardsByUsername, [username]);
};

export const readOverallLeaderboard = async () => {
    return execute<any[]>(leaderboardQueries.readOverallLeaderboard, []);
};

export const readLeaderboardByCategory = async(category: string) => {
    return execute<any[]>(leaderboardQueries.readLeaderboardByCategory, [category]);
}
