const express = require("express");
const router = express.Router();
const { Review } = require("../models");

// Hämta alla recensioner, nyaste först
router.get("/", async (req, res) => {
  const reviews = await Review.findAll({ order: [["createdAt", "DESC"]] });
  res.json(reviews);
});

// Skapa ny recension
router.post("/", async (req, res) => {
  const { name, rating, message } = req.body;
  const review = await Review.create({ name, rating, message });
  res.json(review);
});

module.exports = router;
