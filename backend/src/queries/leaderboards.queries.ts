export const leaderboardQueries = {
    readLeaderboards: `
        SELECT 
            u.username AS username,
            COALESCE(c.categoryName, 'OVERALL') AS category,
            l.totalScore AS score
        FROM leaderboards l
        JOIN users u ON l.userID = u.userID
        LEFT JOIN categories c ON l.categoryID = c.categoryID
        ORDER BY 
            (COALESCE(c.categoryName, 'OVERALL') = 'OVERALL') DESC, 
            category ASC, l.totalScore DESC, u.username ASC;

    `,
    readLeaderboardsByUsername: `
        SELECT 
            u.username AS username, c.categoryName AS category,
            l.totalScore AS score, l.isOverall AS isOverall
        FROM leaderboards l
        JOIN users u ON l.userID = u.userID
        LEFT JOIN categories c ON l.categoryID = c.categoryID
        WHERE u.username = ?
    `,
    readOverallLeaderboard: `
        SELECT
            u.username AS username, l.totalScore AS score
        FROM leaderboards l
        JOIN users u ON l.userID = u.userID
        WHERE l.isOverall = true
        ORDER BY l.totalScore DESC
    `,
    readLeaderboardByCategory: `
        SELECT 
            u.username AS username, c.categoryName AS category, l.totalScore AS score
        FROM leaderboards l
        JOIN users u ON l.userID = u.userID
        JOIN categories c ON l.categoryID = c.categoryID
        WHERE c.categoryName = ?
        ORDER BY l.totalScore DESC;
    `
}