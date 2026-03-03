const { Sequelize } = require("sequelize");

// Skapar en anslutning till MySQL-databasen "webbshop"
// Byt ut 'root' och 'ditt_lösenord' mot dina egna uppgifter
const sequelize = new Sequelize("webbshop", "root", "grupp21", {
  host: "localhost:5000",
  dialect: "mysql", // Talar om för Sequelize att vi använder MySQL
});

module.exports = sequelize;
