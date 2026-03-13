const User = require("./user");
const Product = require("./product");
const Rating = require("./rating");
const Cart = require("./cart");
const CartRow = require("./cartRow");
const Review = require("./review");

// En användare kan ha många varukorgar (en per köptillfälle)
// Varje varukorg tillhör en användare via kolumnen user_id
User.hasMany(Cart, { foreignKey: "user_id" });
Cart.belongsTo(User, { foreignKey: "user_id" });

// Många-till-många mellan Cart och Product via CartRow
// En varukorg kan innehålla många produkter, och en produkt kan finnas i många varukorgar
Cart.belongsToMany(Product, { through: CartRow, foreignKey: "cart_id" });
Product.belongsToMany(Cart, { through: CartRow, foreignKey: "product_id" });

// En produkt kan ha många betyg
// Varje betyg tillhör en produkt via kolumnen product_id
Product.hasMany(Rating, { foreignKey: "product_id" });
Rating.belongsTo(Product, { foreignKey: "product_id" });

module.exports = { User, Product, Rating, Cart, CartRow, Review };
