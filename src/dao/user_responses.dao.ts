import { OkPacket } from "mysql";
import { execute } from "../services/mysql.connector";
import { UserResponse } from "../models/user_responses.model";
import { user_responseQueries } from "../queries/user_responses.queries";

export const readResponses = async () => {
    return execute<UserResponse[]>(user_responseQueries.readResponses, []);
};

export const readResponsesByCategory = async () => {
    return execute<any[]>(user_responseQueries.readResponsesByCategory, []);
};

export const createUserResponse = async (response: UserResponse) => {
    return execute<OkPacket>(user_responseQueries.createUserResponse,
        [response.userID, response.questionID, response.userAnswer, 
         response.isCorrect, response.difficulty, response.score]);
}