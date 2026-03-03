const { Sequelize } = require("sequelize");

// Skapar en anslutning till MySQL-databasen "webbshop"
const sequelize = new Sequelize("webbshop", "root", "password123", {
  host: "localhost", // Bara localhost, ingen port här
  port: 3306, // MySQL:s standardport
  dialect: "mysql",
});

module.exports = sequelize;
