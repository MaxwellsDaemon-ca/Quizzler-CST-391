import { Request, RequestHandler, Response } from "express";
import * as UserDao from '../dao/users.dao'
import { OkPacket } from "mysql";
import * as bcrypt from 'bcrypt';

const saltRounds = 10;

const hashPassword = async (password: string): Promise<string> => {
    return await bcrypt.hash(password, saltRounds);
}

export const readUsers: RequestHandler = async (req: Request, res: Response) => {
    try {
        let users;
        let userID = parseInt(req.query.userID as string);

        console.log('userID', userID);
        if (Number.isNaN(userID)) {
            users = await UserDao.readUsers();
        } else {
            users = await UserDao.readUsersByUserID(userID);
        }

        res.status(200).json(users);
    } catch (error) {
        console.error('[users.controller][readUsers][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when fetching users'
        });
    }
};

export const readUsersByUsername: RequestHandler = async (req: Request, res: Response) => {
    try {
        const users = await UserDao.readUsersByUsername(req.params.username);

        res.status(200).json(users);
    } catch (error) {
        console.error('[users.controller][readUsersByUsername][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when fetching users'
        });
    }
};

export const readUsersBySearchingUsername: RequestHandler = async (req: Request, res: Response) => {
    try {
        console.log('search', req.params.search);
        const users = await UserDao.readUsersBySearchingUsername('%' + req.params.search + '%');

        res.status(200).json(users);
    } catch (error) {
        console.error('[users.controller][readUsersBySearchingUsername][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when fetching users'
        });
    }
};

export const createUser: RequestHandler = async (req: Request, res: Response) => {
    try {

        if (req.body.password) {
            req.body.password = await hashPassword(req.body.password);
        }

        const okp : OkPacket = await UserDao.createUser(req.body);

        console.log('req.body', req.body);
        console.log('user', okp);

        res.status(200).json(okp);
    } catch (error) {
        console.error('[users.controller][createUser][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when creating the user'
        });
    }
};

export const updateUser: RequestHandler = async (req: Request, res: Response) => {
    try {

        if (req.body.password) {
            req.body.password = await hashPassword(req.body.password);
        }
        
        const okp : OkPacket = await UserDao.updateUser(req.body);

        console.log('req.body', req.body);
        console.log('category', okp);

        res.status(200).json(okp);
    } catch (error) {
        console.error('[users.controller][updateUsers][Error]: ', error);
        return res.status(500).json({
            message: 'There was an error when updating user'
        });
    }
};

export const updateUserScore = async (score: number, userID: number) => {
    try {
        const okp: OkPacket = await UserDao.updateUserScore(score, userID);
    } catch (error) {
        console.error('[users.controller][updateUserScore][Error]: ', error);
    }
}

export const deleteUser: RequestHandler = async (req: Request, res: Response) => {
    try {
        let userID = parseInt(req.params.userID as string);

        console.log('userID', userID);
        if(!Number.isNaN(userID)) {
            const response = await UserDao.deleteUser(userID);
            res.status(200).json(response);
        } else {
            throw new Error ("Integer expected for userID");
        }
    } catch (error) {
        console.error('[users.controller][deleteUser][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when deleting the user'
        });
    }
};