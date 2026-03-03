const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");

const CartRow = sequelize.define("CartRow", {
  // Antal av denna produkt i varukorgen
  amount: { type: DataTypes.DOUBLE, allowNull: false },
});

module.exports = CartRow;
