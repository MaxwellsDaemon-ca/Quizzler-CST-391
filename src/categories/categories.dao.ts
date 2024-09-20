import { OkPacket } from "mysql";
import { execute } from "../services/mysql.connector";
import { Category } from "./categories.model";
import { categoryQueries } from "./categories.queries";

export const readCategories = async () => {
    return execute<Category[]>(categoryQueries.readCategories, []);
};

export const readCategoriesByCategoryID = async (categoryID: number) => {
    return execute<Category[]>(categoryQueries.readCategoriesByCategoryID, [categoryID]);
};

export const createCategory = async (category: Category) => {
    return execute<OkPacket>(categoryQueries.createCategory,
        [category.category, category.description]);
};

export const updateCategory = async (category: Category) => {
    return execute<OkPacket>(categoryQueries.updateCategory,
        [category.category, category.description]);
};

export const deleteCategory = async (categoryID: number) => {
    return execute<OkPacket>(categoryQueries.deleteCategory, [categoryID]);
};