import { connection } from "../connection/database.js";
import { nanoid } from "nanoid";

export async function shortenUrl(req, res) {
  const { url } = req.body;
  const expression =
    /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/gm;
  const regex = new RegExp(expression);
  if (!url.match(regex)) {
    res.status(422).send("URL inválida.");
    return;
  }
  try {
    const { user } = res.locals;
    const repeatedUrl = await connection.query(
      `SELECT * FROM urls WHERE urls."userId"=$1 AND urls.address = $2;`,
      [user.id, url]
    );
    if (repeatedUrl.rowCount !== 0) {
      return res.status(422).send("Você já adicionou essa URL.");
    }

    const shortUrl = nanoid(10);
    await connection.query(
      `INSERT INTO urls (address, "shortAddress", "userId") VALUES ($1, $2, $3);`,
      [url, shortUrl, user.id]
    );
    res.status(201).send({shortUrl});
  } catch (error) {
    res.status(500).send(error.message);
  }
}
