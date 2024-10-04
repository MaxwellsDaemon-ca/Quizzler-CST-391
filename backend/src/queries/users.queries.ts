export const userQueries = {
    readUsers: `
        SELECT
            userID AS userID, username AS username, email AS email,
            password AS passwordHash, totalScore AS totalScore
        FROM quizzler.users
    `,
    readUsersByUserID: `
        SELECT
            userID AS userID, username AS username, email AS email,
            password AS passwordHash, totalScore AS totalScore
        FROM quizzler.users
        WHERE quizzler.users.userID = ?
    `,
    readUsersByUsername: `
        SELECT
            userID AS userID, username AS username, email AS email,
            password AS passwordHash, totalScore AS totalScore
        FROM quizzler.users
        WHERE quizzler.users.username = ?
    `,
    readUsersBySearchingUsername: `
        SELECT
            userID AS userID, username AS username, email AS email,
            password AS passwordHash, totalScore AS totalScore
        FROM quizzler.users
        WHERE quizzler.users.username LIKE ?
    `,
    createUser: `
        INSERT INTO users(username, email, password, totalScore)
        VALUES (?, ?, ?, DEFAULT)
    `,
    updateUser: `
        UPDATE quizzler.users
        SET username = ?, email = ?, password = ?
        WHERE userID = ?
    `,
    updateUserScore: `
        UPDATE quizzler.users
        SET totalScore = ?
        WHERE userID = ?
    `,
    deleteUser: `
        DELETE FROM quizzler.users
        WHERE userID = ?
    `
}