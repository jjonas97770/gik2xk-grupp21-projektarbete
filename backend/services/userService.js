const { User, Cart, CartRow, Product } = require("../models");

// Hämtar alla användare
const getAll = async () => await User.findAll();

// Hämtar en specifik användare med sitt id
const getById = async (id) => await User.findByPk(id);

// Skapar en ny användare
const create = async (data) => await User.create(data);

// Uppdaterar en befintlig användare
const update = async (id, data) => {
  const user = await User.findByPk(id);
  if (!user) return null;
  return await user.update(data);
};

// Tar bort en användare
const remove = async (id) => {
  const user = await User.findByPk(id);
  if (!user) return null;
  await user.destroy();
  return true;
};

// Inkluderar produkterna i varukorgen via CartRow
const getCart = async (userId) => {
  const cart = await Cart.findOne({
    where: { user_id: userId, payed: false },
    order: [["createdAt", "DESC"]], // Senast skapade varukorgen
    include: [
      {
        model: Product,
        through: { attributes: ["amount"] }, // Ta med antalet från CartRow
      },
    ],
  });
  if (!cart) return [];

  // Städa upp datan – skicka bara det frontend behöver
  return cart.Products.map((p) => ({
    id: p.id,
    title: p.title,
    price: p.price,
    imageUrl: p.imageUrl,
    amount: p.CartRow.amount,
    totalPrice: p.price * p.CartRow.amount, // Räkna ut delpriset per produkt
  }));
};

// Lägger till en produkt i användarens varukorg
const addToCart = async (userId, productId, amount) => {
  // Hitta en obetald varukorg eller skapa en ny om ingen finns
  const [cart] = await Cart.findOrCreate({
    where: { user_id: userId, payed: false },
  });

  // Kolla om produkten redan finns i varukorgen
  const existing = await CartRow.findOne({
    where: { cart_id: cart.id, product_id: productId },
  });

  if (existing) {
    // Om produkten redan finns – lägg till antalet ovanpå det befintliga
    return await existing.update({ amount: existing.amount + amount });
  } else {
    // Annars – skapa en ny rad i CartRow
    return await CartRow.create({
      cart_id: cart.id,
      product_id: productId,
      amount,
    });
  }
};

module.exports = {
  getAll,
  getById,
  create,
  update,
  remove,
  getCart,
  addToCart,
};
