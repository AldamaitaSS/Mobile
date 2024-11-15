const { DataTypes } = require("sequelize");
const sequelize = require("../database");

const Bidang = sequelize.define("m_bidang", {
  bidang_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  bidang_kode: {
    type: DataTypes.STRING,
  },
  bidang_nama: {
    type: DataTypes.STRING,
  },
}, {
  tableName: 'm_bidang',
  timestamps: false,
});

module.exports = Bidang;
