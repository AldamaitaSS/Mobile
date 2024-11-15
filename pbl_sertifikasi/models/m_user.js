const { DataTypes } = require('sequelize');
const sequelize = require('../database');

const User = sequelize.define('m_user', {
  user_id: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    autoIncrement: true,
  },
  level_id: {
    type: DataTypes.BIGINT,
  },
  nip: {
    type: DataTypes.STRING,
  },
  nama: {
    type: DataTypes.STRING,
  },
  username: {
    type: DataTypes.STRING,
  },
  email: {
    type: DataTypes.STRING,
  },
  password: {
    type: DataTypes.STRING,
  },
}, {
  tableName: 'm_user',
  timestamps: false,
});

module.exports = User;
