import { connection } from "../connection/database.js";

export async function deleteUrl(req, res) {
  const { user } = res.locals;
  const { id } = req.params;

  const existsUrl = await connection.query(
    `
  SELECT * FROM urls WHERE urls.id = $1;
  `,
    [id]
  );
  if (existsUrl.rowCount === 0) {
    return res.sendStatus(404);
  }

  const deleteShortUrl = await connection.query(
    `
  SELECT * FROM urls WHERE urls."userId" = $1 AND urls.id = $2;
  `,
    [user.id, id]
  );

  if (deleteShortUrl.rowCount === 0) {
    return res.sendStatus(401);
  }
  await connection.query(
    `
  DELETE FROM urls WHERE id = $1;
  `,
    [id]
  );
  res.sendStatus(204);
}
