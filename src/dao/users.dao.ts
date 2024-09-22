import { OkPacket } from "mysql";
import { execute } from "../services/mysql.connector";
import { User } from "../models/users.model";
import { userQueries } from "../queries/users.queries";

export const readUsers = async () => {
    return execute<User>(userQueries.readUsers, []);
};

export const readUsersByUserID = async (userID: number) => {
    return execute<User[]>(userQueries.readUsersByUserID, [userID]);
};

export const readUsersByUsername = async (username: string) => {
    return execute<User[]>(userQueries.readUsersByUsername, [username]);
};

export const readUsersBySearchingUsername = async (search: string) => {
    console.log('search param', search);
    return execute<User[]>(userQueries.readUsersBySearchingUsername, [search]);
};

export const createUser = async (user: User) => {
    return execute<OkPacket>(userQueries.createUser,
        [user.username, user.email, user.password]);
};

export const updateUser = async (user: User) => {
    return execute<OkPacket>(userQueries.updateUser,
        [user.username, user.email, user.password, user.userID]);
};

export const updateUserScore = async (score: number, userID: number) => {
    return execute<OkPacket>(userQueries.updateUserScore, [score, userID]);
};

export const deleteUser = async (userID: number) => {
    return execute<OkPacket>(userQueries.deleteUser, [userID]);
};