import { connection } from "../connection/database.js";

export async function shortenUrl(req, res) {
 try {
    const {user} = res.locals;
    res.status(200).send(user)
 } catch(error){
    res.status(500).send(error.message);
 }
}
