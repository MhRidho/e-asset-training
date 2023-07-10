import express from "express";
import {
  getAsset,
  createAsset,
  getAssetById,
  editAsset,
  deleteAsset,
} from "../controllers/asset.js";
const router = express();

router.get("/asset", getAsset);
router.get("/asset/:id", getAssetById);
router.post("/asset", createAsset);
router.patch("/asset/:kode_asset", editAsset);
router.delete("/asset/:kode_asset", deleteAsset);

export default router;
