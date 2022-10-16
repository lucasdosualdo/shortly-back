import { query } from "express";
import { connection } from "../connection/database.js";

export async function getUrlById(req, res) {
  const { id } = req.params;
  try {
    const url = await connection.query(
      `
        SELECT id, "shortAddress" AS "shortUrl", address AS url FROM urls WHERE id = $1;
        `,
      [id]
    );
    if (url.rowCount === 0) {
      return res.sendStatus(404);
    }
    res.status(200).send(url.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
}
