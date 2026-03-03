const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");

const User = sequelize.define("User", {
  // Användarens förnamn – obligatoriskt
  first_name: { type: DataTypes.STRING, allowNull: false },
  // Användarens efternamn – obligatoriskt
  last_name: { type: DataTypes.STRING, allowNull: false },
  // E-post måste vara unik – ingen kan registrera samma adress två gånger
  email: { type: DataTypes.STRING, allowNull: false, unique: true },
  // Lösenord – obligatoriskt (i ett riktigt projekt bör detta hashas)
  password: { type: DataTypes.STRING, allowNull: false },
});

module.exports = User;
