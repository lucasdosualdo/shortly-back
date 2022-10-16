import express from "express";
import { deleteUrl } from "../controllers/deleteController.js";
import { authorizationMiddleware } from "../middlewares/authorizationMiddleware.js";

const router = express.Router();
router.delete("/urls/:id", authorizationMiddleware, deleteUrl);

export default router;
