import { Request, RequestHandler, Response } from "express";
import * as ResponseDao from '../dao/user_responses.dao';
import { OkPacket } from "mysql";

export const readResponses: RequestHandler = async (req: Request, res: Response) => {
    try {
        let responses = await ResponseDao.readResponses();

        res.status(200).json(responses);
    } catch (error) {
        console.error('[user_responses.controller][readResponses][Error]: ', error);
        res.status(500).json({
            message: 'There was an error fetching user responses'
        });
    }
};

export const createUserResponse: RequestHandler = async (req: Request, res: Response) => {
    try {
        const okp: OkPacket = await ResponseDao.createUserResponse(req.body);

        console.log('req.body', req.body);
        console.log('response', okp);

        res.status(200).json(okp);
    } catch (error) {
        console.error('[user_responses.controller][createUserResponse][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when creating the user response'
        });
    }
};