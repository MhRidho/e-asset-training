import Pemanfaatan from "../models/pemanfaatan";
import dotenv from "dotenv";
dotenv.config();
const limitData = process.env.LIMIT_DATA;
const page = 1;

export const getPemanfaatan = (req, res, next) => {
  Pemanfaatan.findAll({
    include: [{}],
  });
};
