const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");

const Product = sequelize.define("Product", {
  // Produktens namn – obligatoriskt
  title: { type: DataTypes.STRING, allowNull: false },
  // Längre beskrivning av produkten
  description: { type: DataTypes.TEXT },
  // Pris som decimaltal
  price: { type: DataTypes.DOUBLE, allowNull: false },
  // URL till en produktbild
  imageUrl: { type: DataTypes.STRING },
  // Kategori för produkten, t.ex. "Skruvdragare", "Cirkelsågar"
  category: { type: DataTypes.STRING },
});

module.exports = Product;
