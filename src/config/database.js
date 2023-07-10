import { Sequelize } from "sequelize";

const db = new Sequelize(
  "postgresql://postgres:ridho123@localhost:5432/e-asset-training"
);

export default db;
