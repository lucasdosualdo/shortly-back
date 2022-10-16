import express from "express";
import { getUserData } from "../controllers/userDataController.js";
import { authorizationMiddleware } from "../middlewares/authorizationMiddleware.js";

const router = express.Router();

router.get("/users/me", authorizationMiddleware, getUserData);

export default router;
