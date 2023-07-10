import express from "express";
const app = express();
import bodyParser from "body-parser";
import cors from "cors";
import path from "path";
import fs from "fs";
import https from "https";
import session from "express-session";
import db from "./src/config/database.js";
import dotenv from "dotenv";
dotenv.config();
import router from "./src/routes/index.js";

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.json());
app.use(cors());

app.get("/", (req, res) => {
  return res.json({
    success: true,
    message: "Backend is running well",
  });
});

app.use(router);

app.listen(
  `${process.env.SERVER_PORT}`,
  console.log(`Server running in port ${process.env.SERVER_PORT}`)
);
