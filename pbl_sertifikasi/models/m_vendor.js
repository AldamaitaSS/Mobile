const { DataTypes } = require('sequelize');
const sequelize = require('../database');

const Vendor = sequelize.define('m_vendor', {
  vendor_id: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    autoIncrement: true,
  },
  vendor_nama: {
    type: DataTypes.STRING,
  },
  alamat: {
    type: DataTypes.STRING,
  },
  kota: {
    type: DataTypes.STRING,
  },
  no_telp: {
    type: DataTypes.STRING,
  },
  alamat_web: {
    type: DataTypes.STRING,
  },
}, {
  tableName: 'm_vendor',
  timestamps: false,
});

module.exports = Vendor;
