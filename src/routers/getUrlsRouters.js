import express from "express";
import {
  getUrlById,
  redirectUrl,
  getRanking,
} from "../controllers/getUrlsController.js";

const router = express.Router();
router.get("/urls/:id", getUrlById);
router.get("/urls/open/:shortUrl", redirectUrl);
router.get("/ranking", getRanking);

export default router;
