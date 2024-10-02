const express = require("express");
const cors = require("cors");
require("dotenv").config();
const route = require("./server/index.route");
const app = express();
const PORT = process.env.PORT || 4000;
const bodyParser = require("body-parser");
// const authRouter=require('./server/routes/auth.route');
// const { connection } = require('./config/db');
const {winstonLogger, errorLogger} = require('./config/winston');
// const { handleError } = require("./server/helpers/errorHandler");
const corsOptions = {
  origin: 'https://vayu-one.vercel.app', // Allow requests from your frontend
  methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
  credentials: true, // If you're sending cookies or authentication tokens
  allowedHeaders: 'Content-Type,Authorization', // Include any headers you're using
};
app.use(cors(corsOptions));

app.use(express.json());

// Middleware to parse different body formats with a large limit
app.use(bodyParser.json({ limit: "500mb" }));
app.use(bodyParser.urlencoded({ extended: true, limit: "500mb", parameterLimit: 50000 }));
app.use(bodyParser.raw({ limit: "500mb" }));
app.use(bodyParser.text({ limit: "500mb" }));


app.use(cors()); // Enable CORS
app.use(express.json()); // Parse JSON request bodies

app.use(winstonLogger);
app.use(errorLogger);

// these are the routes
app.use("/api/v1", route)
// app.use("/auth/v1", authRouter)

// app.use((err, req, res, next) => {
//     handleError(err, res);
// });  

const start = () => {
    try {
        // connection()
        app.listen(PORT, () => {
            console.log("On server port 4000"); 
        });
    } catch (error) {
        console.log(error);
    }
}

start();
