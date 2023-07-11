import express from "express";
const router = express.Router();

// pemanggilan fungsi
import assetRoutes from "./asset/index.js";
import pemanfaatanRoutes from "./pemanfaatan/index.js";

// Routing
router.use("/asset", assetRoutes);
router.use("/pemanfaatan", pemanfaatanRoutes);

export default router;
