import Asset from "../models/asset.js";
import dotenv from "dotenv";
dotenv.config();
const limitData = process.env.LIMIT_DATA;
const page = 1;

export const getAsset = async (req, res) => {
  const pageInfo = {};
  const countAsset = await Asset.count();
  pageInfo.totalData = countAsset;
  pageInfo.totalPage = Math.ceil(countAsset / limitData);
  pageInfo.currentPage = parseInt(page);
  pageInfo.nextPage =
    pageInfo.currentPage < pageInfo.totalPage ? pageInfo.currentPage + 1 : null;
  pageInfo.prevPage =
    pageInfo.currentPage > pageInfo.totalPage ? pageInfo.currentPage - 1 : null;
  pageInfo.limit = limitData;
  try {
    const assets = await Asset.findAll({
      attributes: [
        "kode_asset",
        "nama_asset",
        "kode_bidang",
        "kode_kartu",
        "ucr",
        "uch",
        "udcr",
        "udch",
      ],
    });
    res.json({
      success: true,
      message: "List All Asset",
      pageInfo: pageInfo,
      results: assets,
    });
  } catch (error) {
    console.log(error);
  }
};

export const createAsset = async (req, res) => {
  const {
    kode_asset,
    nama_asset,
    kode_bidang,
    kode_kartu,
    ucr,
    uch,
    udcr,
    udch,
  } = req.body;
  try {
    await Asset.create({
      kode_asset: kode_asset,
      nama_asset: nama_asset,
      kode_bidang: kode_bidang,
      kode_kartu: kode_kartu,
      ucr: ucr,
      uch: uch,
      udcr: udcr,
      udch: udch,
    });
    res.json({ msg: "Create Asset success" });
  } catch (error) {
    console.log(error);
  }
};

// get by Id
export const getAssetById = async (req, res) => {
  const postId = req.params.id;
  try {
    const getId = await Asset.findByPk(postId);
    if (getId) {
      res.json({
        success: true,
        message: "Detail Asset",
        result: getId,
      });
    } else {
      res.status(404).json({ msg: "Get Id Not Found" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ msg: "Server Error" });
  }
};

export const editAsset = async (req, res) => {
  const kodeAsset = req.params.kode_asset;
  try {
    await Asset.update(req.body, {
      where: {
        kode_asset: kodeAsset,
      },
    });

    res.status(201).json({
      success: true,
      msg: "Edit data success",
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Server Error" });
  }
};

export const deleteAsset = async (req, res) => {
  try {
    const kodeAsset = req.params.kode_asset;
    await Asset.destroy({
      where: {
        kode_asset: kodeAsset,
      },
    });
    res.status(200).json({ msg: "Asset Deleted" });
  } catch (error) {
    console.log(error);
    res.status(500).json({ msg: "Server Error" });
  }
};
