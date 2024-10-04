import { Router } from "express";
import * as UsersController from '../controllers/users.controller';

const router = Router();

router.
    route('/api/users').
    get(UsersController.readUsers);

router.
    route('/api/users/:search').
    get(UsersController.readUsersBySearchingUsername);

router.
    route('/api/users/user/:username').
    get(UsersController.readUsersByUsername);

router.
    route('/api/users/signup').
    post(UsersController.createUser);

router.
    route('/api/users').
    put(UsersController.updateUser);

router.
    route('/api/users/:userID').
    delete(UsersController.verifyToken, UsersController.deleteUser);

router.
    route('/api/users/login').
    post(UsersController.loginUser);



export default router;