const express = require('express');
const dotenv = require('dotenv');
const connectDB = require('./config/db.config')
const app = express();
const imageRouter = require('./routes/image.routes')

// DB connection
dotenv.config({ path: './config/config.env' })
connectDB();

app.use(express.json());

//Routes
app.use("/", imageRouter);

app.listen(3000);