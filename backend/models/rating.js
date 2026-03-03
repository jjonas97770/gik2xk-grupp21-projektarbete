const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");

const Rating = sequelize.define("Rating", {
  // Betyget som ett decimaltal, t.ex. 4.5
  rating: { type: DataTypes.DOUBLE, allowNull: false },
});

module.exports = Rating;
