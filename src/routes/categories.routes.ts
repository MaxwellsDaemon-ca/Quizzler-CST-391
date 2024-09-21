import { Router } from "express";
import * as CategoriesController from '../controllers/categories.controller';

const router = Router();

router.
    route('/api/categories').
    get(CategoriesController.readCategories);

router.
    route('/api/categories').
    post(CategoriesController.createCategory);

router.
    route('/api/categories').
    put(CategoriesController.updateCategory);

router.
    route('/api/categories/:categoryID').
    delete(CategoriesController.deleteCategory);

export default router;