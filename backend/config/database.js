const { Sequelize } = require("sequelize");


const sequelize = new Sequelize("webbshop", "webbshopuser", "webbshop123", {
  host: "localhost",
  port: 3306,
  dialect: "mysql",
});


module.exports = sequelize;