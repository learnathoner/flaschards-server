const mysql = require('mysql');
const { promisify } = require('util');
const Sequelize = require('sequelize');

const host = process.env.DATABASE_URL || {
  database: 'flashcards',
  username: 'Mike',
  password: null,
  dialect: 'postgres'
};

const sequelize = new Sequelize(host);

sequelize
  .authenticate()
  .then(() => console.log('connection made'))
  .catch(() => console.log('cannot connect'));

exports.promiseQuery = query =>
  sequelize.query(query, { type: sequelize.QueryTypes.SELECT });

exports.insertQuery = query => sequelize.query(query);

exports.updateQuery = query =>
  sequelize.query(query, { type: sequelize.QueryTypes.UPDATE });

exports.MODE_PRODUCTION = 'mode_production';
