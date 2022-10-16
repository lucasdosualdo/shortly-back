import express from "express";
import { getUrlById, redirectUrl } from "../controllers/getUrlsController.js";

const router = express.Router();
router.get("/urls/:id", getUrlById);
router.get("/urls/open/:shortUrl", redirectUrl);

export default router;
