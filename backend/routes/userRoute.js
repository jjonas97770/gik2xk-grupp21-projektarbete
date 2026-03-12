const express = require("express");
const router = express.Router();
const userService = require("../services/userService");
const { Cart } = require("../models");

// GET /users – hämtar alla användare
router.get("/", async (req, res) => {
  try {
    res.json(await userService.getAll());
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// GET /users/:id/getCart – hämtar varukorgen (måste stå före /:id)
router.get("/:id/getCart", async (req, res) => {
  try {
    res.json(await userService.getCart(req.params.id));
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// POST /users/:id/payCart – markerar varukorgen som betald (måste stå före /:id)
router.post("/:id/payCart", async (req, res) => {
  try {
    const cart = await Cart.findOne({
      where: { user_id: req.params.id, payed: false },
      order: [["createdAt", "DESC"]],
    });
    if (!cart)
      return res.status(404).json({ error: "Ingen varukorg hittades" });
    await cart.update({ payed: true });
    res.json({ message: "Köp genomfört!" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// GET /users/:id – hämtar en specifik användare
router.get("/:id", async (req, res) => {
  try {
    const user = await userService.getById(req.params.id);
    if (!user) return res.status(404).json({ error: "Hittades inte" });
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// POST /users – skapar en ny användare
router.post("/", async (req, res) => {
  try {
    res.status(201).json(await userService.create(req.body));
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// PUT /users/:id – uppdaterar en befintlig användare
router.put("/:id", async (req, res) => {
  try {
    const user = await userService.update(req.params.id, req.body);
    if (!user) return res.status(404).json({ error: "Hittades inte" });
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// DELETE /users/:id – tar bort en användare
router.delete("/:id", async (req, res) => {
  try {
    const result = await userService.remove(req.params.id);
    if (!result) return res.status(404).json({ error: "Hittades inte" });
    res.json({ message: "Användare borttagen" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = router;
