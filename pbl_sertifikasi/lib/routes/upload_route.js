const express = require('express');
const router = express.Router();
const UploadSertifikat = require('../models/upload_sertifikat');

router.post('/upload', async (req, res) => {
  try {
    const { nomorSertifikasi, tanggalPelaksanaan, tanggalBerlaku, namaKegiatan, namaBidang, namaVendor, namaFile } = req.body;
    const newRecord = await UploadSertifikat.create({
      no_sertif: nomorSertifikasi,
      tanggal_pelaksanaan: tanggalPelaksanaan,
      tanggal_berlaku: tanggalBerlaku,
      nama_sertif: namaKegiatan,
      bidang_id: namaBidang,
      nama_vendor: namaVendor,
      image: namaFile,
    });
    res.status(201).json({ message: 'Data berhasil disimpan', data: newRecord });
  } catch (error) {
    res.status(500).json({ error: 'Gagal menyimpan data' });
  }
});

module.exports = router;
