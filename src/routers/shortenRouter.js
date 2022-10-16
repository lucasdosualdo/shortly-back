import express from "express";
import { shortenUrl } from "../controllers/shortenController.js";
import { authorizationMiddleware } from "../middlewares/authorizationMiddleware.js";

const router = express.Router();
router.post("/urls/shorten", authorizationMiddleware, shortenUrl);

export default router;
