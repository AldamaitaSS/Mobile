const { DataTypes } = require('sequelize');
const sequelize = require('../database');

const UploadSertifikat = sequelize.define('upload_sertifikat', {
  sertif_id: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    autoIncrement: true,
  },
  user_id: {
    type: DataTypes.BIGINT,
  },
  no_sertif: {
    type: DataTypes.STRING(100),
  },
  nama_sertif: {
    type: DataTypes.STRING(100),
  },
  tanggal_pelaksanaan: {
    type: DataTypes.DATE,
  },
  tanggal_berlaku: {
    type: DataTypes.DATE,
  },
  bidang_id: {
    type: DataTypes.BIGINT,
  },
  nama_vendor: {
    type: DataTypes.STRING(100),
  },
  image: {
    type: DataTypes.STRING(255),
  },
  
}, {
  tableName: 'upload_sertifikat',
  timestamps: false,
});

module.exports = UploadSertifikat;
