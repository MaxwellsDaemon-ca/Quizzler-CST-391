import { Request, RequestHandler, Response } from 'express';
import * as CategoryDao from '../dao/categories.dao';
import { OkPacket } from 'mysql';

export const readCategories: RequestHandler = async (req: Request, res: Response) => {
    try {
        let categories;
        let categoryID = parseInt(req.query.categoryID as string);

        console.log('categoryId', categoryID);
        if (Number.isNaN(categoryID)) {
            categories = await CategoryDao.readCategories();
        } else {
            categories = await CategoryDao.readCategoriesByCategoryID(categoryID);
        }

        res.status(200).json(categories);
    } catch (error) {
        console.error('[categories.controller][readCategories][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when fetching categories'
        });
    }
};

export const createCategory: RequestHandler = async (req: Request, res: Response) => {
    try {
        const okp : OkPacket = await CategoryDao.createCategory(req.body);

        console.log('req.body', req.body);
        console.log('category', okp);

        res.status(200).json(okp);
    } catch (error) {
        console.error('[categories.controller][createCategory][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when creating the category'
        });
    }
};

export const updateCategory: RequestHandler = async (req: Request, res: Response) => {
    try {
       const okp : OkPacket = await CategoryDao.updateCategory(req.body);

       console.log('req.body', req.body);
       console.log('category', okp);

       res.status(200).json(okp);
    }   catch (error) {
        console.error('[categories.controller][updateCategory][Error]: ', error);
        return res.status(500).json({
            message: 'There was an error when updating category'
        });
    }
};

export const deleteCategory: RequestHandler = async (req: Request, res: Response) => {
    try {
        let categoryID = parseInt(req.params.categoryID as string);

        console.log('categoryID', categoryID);
        if(!Number.isNaN(categoryID)) {
            const response = await CategoryDao.deleteCategory(categoryID);
            res.status(200).json(response);
        } else {
            throw new Error ("Integer expected for categoryID");
        }

    } catch (error) {
        console.error('[categories.controller][deleteCategory][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when deleting the category'
        });
    }
};
