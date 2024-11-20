const { DataTypes } = require('sequelize');
const sequelize = require('../database');

const JenisSertifikasi = sequelize.define('m_jenis_sertifikasi', {
  jenis_id: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    autoIncrement: true,
  },
  jenis_kode: {
    type: DataTypes.STRING,
  },
  jenis_nama: {
    type: DataTypes.STRING,
  },
  
}, {
  tableName: 'm_jenis_sertifikasi',
  timestamps: false,
});

module.exports = JenisSertifikasi;
