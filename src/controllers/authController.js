import { connection } from "../connection/database.js";
import bcrypt from "bcrypt";
import { v4 as uuid, validate } from "uuid";
import { signUpSchema, signInSchema } from "../schemas/authSchema.js";

export async function signUpUser(req, res) {
  const { name, email, password, confirmPassword } = req.body;
  const validation = signUpSchema.validate(req.body, { abortEarly: false });
  if (validate.error) {
    const err = validation.error.details.map((err) => err.message);
    res.status(422).send(err);
    return;
  }
  try {
    const existingEmail = await connection.query(
      `SELECT * FROM users WHERE email = $1;`,
      [email]
    );
    if (existingEmail.rows.length !== 0) {
      res.status(422).send("Email ou senha inválidos!");
      return;
    }
    if (password !== confirmPassword) {
      return res.status().send("Insira as senhas corretamente!");
    }
    const passwordList = await connection.query(`SELECT password FROM users`);

    const existingPassword = passwordList.rows.filter((value) =>
      bcrypt.compareSync(password, value.password)
    );

    if (existingPassword.length !== 0) {
      return res.status(422).send("Email ou senha inválidos!");
    }

    const passwordHash = bcrypt.hashSync(password, 10);

    await connection.query(
      `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`,
      [name, email, passwordHash]
    );

    res.send(201);
  } catch (error) {
    console.log(error.message);
    res.sendStatus(500);
  }
}
