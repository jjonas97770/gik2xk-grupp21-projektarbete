const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");

const Cart = sequelize.define("Cart", {
  // false = ej betald, true = köp genomfört
  payed: { type: DataTypes.BOOLEAN, defaultValue: false },
});

module.exports = Cart;
