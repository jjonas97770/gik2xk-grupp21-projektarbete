const express = require("express");
const cors = require("cors");
const sequelize = require("./config/database");

// Importera models/index.js så att alla relationer laddas in
require("./models");

const productRoutes = require("./routes/productRoute");
const userRoutes = require("./routes/userRoute");

const app = express();

// Tillåt anrop från andra origins, t.ex. React-appen på en annan port
app.use(cors());

// Gör så att Express kan läsa JSON i request body
app.use(express.json());

// Koppla routes till sina prefix
// Alla anrop till /products hanteras av productRoutes
// Alla anrop till /users hanteras av userRoutes
app.use("/products", productRoutes);
app.use("/users", userRoutes);

const PORT = 3000;

// Synkronisera Sequelize med databasen (alter:true uppdaterar tabeller om modellen ändrats)
// När databasen är redo startar vi servern
sequelize.sync({ alter: true }).then(() => {
  console.log("Databas synkad!");
  app.listen(PORT, () => console.log(`Server körs på port ${PORT}`));
});
