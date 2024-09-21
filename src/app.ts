import dotenv from 'dotenv';
import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import logger from './middleware/logger.middleware';
import categoriesRouter from './routes/categories.routes';
import usersRouter from './routes/users.routes';

dotenv.config();

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(cors());
app.use(helmet());

if (process.env.NODE_ENV == 'development') {
    app.use(logger);
    console.log(process.env.GREETING + ' in dev mode');
}

app.use('/', [categoriesRouter, usersRouter]);

app.listen(port, () => {
    console.log(`Quizzler App listening at http://localhost:${port}`);
});