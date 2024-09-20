export const categoryQueries = {
    readCategories: `
        SELECT
            categoryID AS categoryID, categoryName AS category, description AS description
        FROM quizzler.categories
    `,
    readCategoriesByCategoryID: `
        SELECT
            categoryID AS categoryID, categoryName AS category, description AS description
        FROM quizzler.categories
        WHERE quizzler.categories.categoryID = ?
    `,
    createCategory: `
        INSERT INTO categories(categoryName, description) VALUE(?,?)
    `,
    updateCategory: `
        UPDATE quizzler.categories
        SET categoryName = ?, description = ?
        WHERE categoryID = ?
    `,
    deleteCategory: `
        DELETE FROM quizzler.categories
        WHERE categoryID = ?
    `
}