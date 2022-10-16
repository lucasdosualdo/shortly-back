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

export async function redirectUrl(req, res) {
  const { shortUrl } = req.params;
  try {
    const existsUrl = await connection.query(
      `
        SELECT * FROM urls WHERE "shortAddress" = $1;
        `,
      [shortUrl]
    );
    if (existsUrl.rowCount === 0) {
      return res.sendStatus(404);
    }

    const address = existsUrl.rows[0].address;
    console.log(existsUrl.rows[0]);
    const updateViews = existsUrl.rows[0].views + 1;
    await connection.query(`UPDATE urls SET views = $1 WHERE id = $2;`, [
      updateViews,
      existsUrl.rows[0].id,
    ]);
    res.redirect(address);
    return;
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function getRanking(req, res) {
  const rankingArray = await connection.query(`
  SELECT users.id, users.name, COUNT(urls.address) AS "linksCount", SUM(urls.views) AS "visitCount" FROM users 
  JOIN urls ON users.id = urls."userId"
  GROUP BY users.id
  ORDER BY "visitCount" DESC
  LIMIT 10;
  `);
  res.status(200).send(rankingArray.rows);
}
