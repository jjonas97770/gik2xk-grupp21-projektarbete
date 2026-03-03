const { Product, Rating } = require("../models");

// Hämtar alla produkter från databasen
const getAll = async () => {
  return await Product.findAll();
};

// Hämtar en specifik produkt med alla dess betyg
// Räknar också ut snittbetyget och lägger till det i svaret
const getById = async (id) => {
  const product = await Product.findByPk(id, {
    include: [{ model: Rating }], // Hämtar kopplade betyg samtidigt (JOIN)
  });
  if (!product) return null;

  const ratings = product.Ratings;

  // Räkna ut snittbetyget, eller 0 om inga betyg finns
  const avgRating = ratings.length
    ? ratings.reduce((sum, r) => sum + r.rating, 0) / ratings.length
    : 0;

  // Returnera produkten som ett vanligt objekt med avgRating tillagt
  return { ...product.toJSON(), avgRating };
};

// Skapar en ny produkt med datan som skickas in
const create = async (data) => {
  return await Product.create(data);
};

// Uppdaterar en befintlig produkt med ny data
const update = async (id, data) => {
  const product = await Product.findByPk(id);
  if (!product) return null; // Returnera null om produkten inte finns
  return await product.update(data);
};

// Tar bort en produkt från databasen
const remove = async (id) => {
  const product = await Product.findByPk(id);
  if (!product) return null;
  await product.destroy();
  return true;
};

// Lägger till ett betyg kopplat till en specifik produkt
const addRating = async (productId, rating) => {
  return await Rating.create({ rating, product_id: productId });
};

module.exports = { getAll, getById, create, update, remove, addRating };
