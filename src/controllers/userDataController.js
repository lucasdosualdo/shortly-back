import { connection } from "../connection/database.js";

export async function getUserData(req, res) {
  const { user } = res.locals;

  let shortenedUrls = await connection.query(
    `SELECT id, "shortAddress" AS "shortUrl", address AS url, views AS "visitCount" FROM urls WHERE urls."userId"=$1;`,
    [user.id]
  );
  shortenedUrls = shortenedUrls.rows;
  const viewsArray = shortenedUrls.map((value) => value.visitCount);
  const totalViews = viewsArray.reduce(
    (initialValue, currentValue) => initialValue + currentValue
  );
  console.log(totalViews);
  const userData = {
    id: user.id,
    name: user.name,
    visitCount: totalViews,
    shortenedUrls,
  };
  res.status(200).send(userData);
}
