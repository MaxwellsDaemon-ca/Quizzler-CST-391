import { Request, RequestHandler, Response } from "express";
import * as UserDao from '../dao/users.dao'
import { OkPacket } from "mysql";
import * as bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { User } from '../models/users.model';
import { CustomRequest } from "../types";

const SECRET_KEY = "BUc[+a_MzzVyB{hY1BC~P^`E*{ucmr]V";

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

export const loginUser: RequestHandler = async (req: Request, res: Response) => {
    try {
        const { username, password } = req.body;
        const users: User[] = await UserDao.readUsersByUsername(username);

        if (users.length > 0) {
            const user = users[0];
            if (bcrypt.compareSync(password, user.password)) {
                const token = jwt.sign(
                    { username: user.username, userID: user.userID, role: user.role },  
                    SECRET_KEY,
                    { expiresIn: "1h" }
                );
                res.status(200).json({ message: "Login successful", token, role: user.role });
            } else {
                res.status(401).json({ message: "Invalid credentials" });
            }
        } else {
            res.status(404).json({ message: "User not found" });
        }
    } catch (error) {
        res.status(500).json({ message: "Error during login" });
    }
};





export const createUser: RequestHandler = async (req: Request, res: Response) => {
    try {
        const { username, email, password } = req.body;
        const hashedPassword = bcrypt.hashSync(password, 10);

        // Create a User object using the UserModel class
        const newUser: User = {
            userID: 0, // This will be auto-incremented by the DB
            username,
            email,
            password: hashedPassword,
            totalScore: 0,
            role: 'user'
        };

        const okp: OkPacket = await UserDao.createUser(newUser);
        res.status(201).json(okp);
    } catch (error) {
        res.status(500).json({ message: "Error creating user" });
    }
};



export const verifyToken = (req: CustomRequest, res: Response, next: Function) => {
    const token = req.headers["authorization"];
    if (!token) {
        return res.status(403).json({ message: "Token required" });
    }
    try {
        const decoded = jwt.verify(token.split(" ")[1], SECRET_KEY);
        req.user = decoded;  // Attach the decoded token to the request
        next();
    } catch (error) {
        res.status(401).json({ message: "Invalid token" });
    }
};

export const updateUser: RequestHandler = async (req: Request, res: Response) => {
    try {

        if (req.body.password) {
            req.body.password = bcrypt.hashSync(req.body.password, 10);
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