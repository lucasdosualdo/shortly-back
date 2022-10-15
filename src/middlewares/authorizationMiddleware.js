import { connection } from "../connection/database.js";

export async function authorizationMiddleware(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) return res.sendStatus(401);
  try {
    const session = await connection.query(
      `SELECT * FROM sessions WHERE $1 = sessions.token;`,
      [token]
    );

    if (session.rowCount === 0) {
      return res.sendStatus(401);
    }
    let user = await connection.query(
      `SELECT * FROM users WHERE $1 = users.id;`,
      [session.rows[0].userId]
    );
    if (user.rowCount === 0) {
      return res.sendStatus(401);
    }
    user = user.rows[0];

    res.locals.user = user;
    next();
  } catch (error) {
    res.status(500).send(error.message);
  }
}
