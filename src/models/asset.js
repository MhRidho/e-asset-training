import { Sequelize } from "sequelize";
import db from "../config/database.js";

const { DataTypes } = Sequelize;

const Asset = db.define(
  "asset",
  {
    kode_asset: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: true,
    },
    nama_asset: {
      type: DataTypes.STRING,
    },
    kode_bidang: {
      type: DataTypes.STRING,
    },
    kode_kartu: {
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
    tableName: "asset",
    createdAt: "udcr",
    updatedAt: "udch",
  }
);

export default Asset;
