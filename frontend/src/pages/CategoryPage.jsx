import { useEffect, useState } from "react";
import {
  Grid,
  Card,
  CardMedia,
  CardContent,
  Typography,
  Box,
  CircularProgress,
} from "@mui/material";
import { useNavigate } from "react-router-dom";
import { getProducts } from "../api/index";

// Alla kategorier som ska visas oavsett om det finns produkter eller inte
const allCategories = [
  "Batterier & Laddare",
  "Betongvibratorer",
  "Borrhammare",
  "Slagskruvdragare",
  "Cirkelsågar",
  "Kap och Gersågar",
  "Lampor",
  "Metallsågar & Metallbearbetning",
  "Mutterdragare",
  "Nibblare och Plåtsaxar",
  "Polermaskiner",
  "Slipmaskiner",
  "Dyckert & Stiftpistoler",
  "Sticksågar",
  "Tigersågar",
  "Vinkelslipar",
  "Paket",
  "Övrigt",
];

function CategoryPage() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

  // Hämta alla produkter för att kunna visa en bild per kategori
  useEffect(() => {
    getProducts()
      .then((res) => {
        setProducts(res.data);
        setLoading(false);
      })
      .catch((err) => {
        console.error(err);
        setLoading(false);
      });
  }, []);

  // Hitta första produkten i kategorin och använd dess bild
  // Om ingen produkt finns, visa en platshållarbild med kategorinamnet
  const getImageForCategory = (category) => {
    const product = products.find((p) => p.category === category);
    return (
      product?.imageUrl ||
      `https://via.placeholder.com/300x180?text=${encodeURIComponent(category)}`
    );
  };

  if (loading) {
    return (
      <Box sx={{ display: "flex", justifyContent: "center", mt: 4 }}>
        <CircularProgress />
      </Box>
    );
  }

  return (
    <Box>
      <Typography variant="h4" sx={{ mb: 3 }}>
        Milwaukee M18 – Alla kategorier
      </Typography>
      <Grid container spacing={3} justifyContent="center">
        {allCategories.map((category) => (
          <Grid item xs={12} sm={6} md={3} key={category}>
            <Card
              sx={{
                cursor: "pointer",
                "&:hover": { opacity: 0.85 },
                width: 300,
              }}
              onClick={() =>
                navigate(`/?category=${encodeURIComponent(category)}`)
              }
            >
              {/* Produktbild som representerar kategorin */}
              <CardMedia
                component="img"
                height="180"
                image={getImageForCategory(category)}
                alt={category}
                sx={{ objectFit: "contain", backgroundColor: "#f5f5f5", p: 2 }}
              />
              {/* Kategorinamn i blå banner längst ner */}
              <CardContent sx={{ backgroundColor: "#e31837", py: 1 }}>
                <Typography
                  variant="subtitle1"
                  sx={{
                    color: "white",
                    fontWeight: "bold",
                    textAlign: "center",
                  }}
                >
                  {category}
                </Typography>
              </CardContent>
            </Card>
          </Grid>
        ))}
      </Grid>
    </Box>
  );
}

export default CategoryPage;
