const express = require("express");
const router = express.Router();
const productService = require("../services/productService");

// GET /products – hämtar alla produkter
router.get("/", async (req, res) => {
  try {
    res.json(await productService.getAll());
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// GET /products/:id – hämtar en produkt med betyg och snittbetyg
router.get("/:id", async (req, res) => {
  try {
    const product = await productService.getById(req.params.id);
    if (!product) return res.status(404).json({ error: "Hittades inte" });
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// POST /products – skapar en ny produkt
// Body ska innehålla: title, description, price, imageUrl
router.post("/", async (req, res) => {
  try {
    res.status(201).json(await productService.create(req.body));
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// PUT /products/:id – uppdaterar en befintlig produkt
router.put("/:id", async (req, res) => {
  try {
    const product = await productService.update(req.params.id, req.body);
    if (!product) return res.status(404).json({ error: "Hittades inte" });
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// DELETE /products/:id – tar bort en produkt
router.delete("/:id", async (req, res) => {
  try {
    const result = await productService.remove(req.params.id);
    if (!result) return res.status(404).json({ error: "Hittades inte" });
    res.json({ message: "Produkt borttagen" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// POST /products/:id/rating – lägger till ett betyg på en produkt
// Body ska innehålla: rating (ett tal, t.ex. 4.5)
router.post("/:id/rating", async (req, res) => {
  try {
    res
      .status(201)
      .json(await productService.addRating(req.params.id, req.body.rating));
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// POST /products/:id/addToCart – lägger till produkten i en användares varukorg
// Body ska innehålla: userId, amount
router.post("/:id/addToCart", async (req, res) => {
  try {
    const { userId, amount } = req.body;
    const userService = require("../services/userService");
    res
      .status(201)
      .json(await userService.addToCart(userId, req.params.id, amount));
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = router;
