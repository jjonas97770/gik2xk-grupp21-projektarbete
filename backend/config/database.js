// Laddar in miljövariabler från .env-filen så att vi kan använda process.env.DB_PASS osv.
// Detta måste ligga HÖGST UPP i filen, innan något annat körs.
require("dotenv").config();

const { Sequelize } = require("sequelize");

// Skapar en anslutning till MySQL-databasen.
// Värdena hämtas från .env-filen om den finns.
// Om .env saknas används fallback-värdena till höger om ||
// så att servern fortfarande startar även utan .env.
const sequelize = new Sequelize(
  process.env.DB_NAME || "webbshop", // Databasnamn
  process.env.DB_USER || "root", // MySQL-användare
  process.env.DB_PASS || "password123", // MySQL-lösenord
  {
    host: process.env.DB_HOST || "localhost", // Adressen till MySQL-servern
    port: process.env.DB_PORT || 3306, // MySQL:s standardport
    dialect: "mysql", // Vi använder MySQL som databas

    // dialectOptions skickas direkt till MySQL-drivrutinen (mysql2).
    // charset: "utf8mb4" tvingar anslutningen att använda UTF-8 med stöd för
    // alla tecken inklusive svenska åäö.
    // UTAN denna rad kan åäö bli felmappade mellan Node.js och MySQL.
    dialectOptions: {
      charset: "utf8mb4",
    },
  },
);

module.exports = sequelize;
