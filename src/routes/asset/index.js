import express from "express";
import {
  getAsset,
  createAsset,
  getAssetById,
  editAsset,
  deleteAsset,
} from "../../controllers/asset.js";
const router = express.Router();

// Routing untuk asset
router.get("/", getAsset);
router.get("/:id", getAssetById);
router.post("/", createAsset);
router.patch("/:kode_asset", editAsset);
router.delete("/:kode_asset", deleteAsset);

// Routing untuk tabel bentuk pemanfaatan

export default router;
