import { Sequelize } from "sequelize";
import db from "../config/database";

const { DataTypes } = Sequelize;

const Pemanfaatan = db.define(
  "ref_bentuk_pemanfaatan",
  {
    kode_bentuk_pemanfaatan: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: true,
    },
    nama_bentuk_pemanfaatan: {
      type: DataTypes.STRING,
    },
    ucr: {
      type: DataTypes.STRING,
    },
    uch: {
      type: DataTypes.STRING,
    },
    udcr: {
      type: DataTypes.DATE,
    },
    udch: {
      type: DataTypes.DATE,
    },
  },
  {
    tableName: "ref_bentuk_pemanfaatan",
    createdAt: "udcr",
    updatedAt: "udch",
  }
);

export default Pemanfaatan;
