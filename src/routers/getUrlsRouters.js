import express from "express";
import { getUrlById } from "../controllers/getUrlsController.js";

const router = express.Router();
router.post("/urls/:id", getUrlById);

export default router;
