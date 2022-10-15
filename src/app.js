import express from "express";
import joi from "joi";
import cors from "cors";
import dotenv from "dotenv";
import { connection } from "./connection/database.js";
import authRouters from "./routers/authRouters.js";
import shortenRouters from "./routers/shortenRouters.js";

dotenv.config();
const app = express();
app.use(express.json());
app.use(cors());

app.use("/status", (req, res) => {
  res.send("server on");
});

app.use(authRouters);
app.use(shortenRouters);

app.listen(process.env.PORT, () => {
  console.log("listening in port " + process.env.PORT);
});
