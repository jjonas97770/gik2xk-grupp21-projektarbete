import { useEffect, useState } from "react";
import {
  Grid,
  Card,
  CardContent,
  CardMedia,
  CardActions,
  Typography,
  Button,
  CircularProgress,
  Box,
} from "@mui/material";
import { useNavigate, useSearchParams } from "react-router-dom";
import { getProducts } from "../api/index";

function ProductsPage() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

  // Hämtar kategori från URL:en, t.ex. /?category=Borrhammare
  const [searchParams] = useSearchParams();
  const category = searchParams.get("category");

  // Hämta alla produkter när sidan laddas
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

  // Om en kategori är vald i menyn, filtrera produkterna – annars visa alla
  const filteredProducts = category
    ? products.filter((p) => p.category === category)
    : products;

  // Visa laddningsindikator medan produkter hämtas
  if (loading) {
    return (
      <Box sx={{ display: "flex", justifyContent: "center", mt: 4 }}>
        <CircularProgress />
      </Box>
    );
  }

  return (
    <Box>
      {/* Rubrik – visar kategorinamn om filtrerad, annars "Våra verktyg" */}
      <Typography variant="h4" sx={{ mb: 1 }}>
        {category ? category : "Våra verktyg"}
      </Typography>

      {/* Visa "tillbaka"-knapp om en kategori är vald */}
      {category && (
        <Button sx={{ mb: 3 }} onClick={() => navigate(-1)}>
          ← Tillbaka
        </Button>
      )}

      {/* Produktkort i rutnät */}
      <Grid container spacing={3}>
        {filteredProducts.map((product) => (
          <Grid item xs={12} sm={6} md={4} key={product.id}>
            <Card
              sx={{ height: "100%", display: "flex", flexDirection: "column" }}
            >
              {/* Produktbild */}
              <CardMedia
                component="img"
                height="200"
                image={
                  product.imageUrl ||
                  "https://via.placeholder.com/300x200?text=Ingen+bild"
                }
                alt={product.title}
                sx={{ objectFit: "contain", backgroundColor: "#f5f5f5", p: 1 }}
              />
              <CardContent sx={{ flexGrow: 1 }}>
                <Typography variant="h6">{product.title}</Typography>
                <Typography
                  variant="body2"
                  color="text.secondary"
                  sx={{ mb: 1 }}
                >
                  {product.description}
                </Typography>
                {/* Pris */}
                <Typography variant="h6" color="primary">
                  {product.price} kr
                </Typography>
              </CardContent>
              <CardActions>
                {/* Knapp för att se produktdetaljer */}
                <Button
                  size="small"
                  variant="contained"
                  onClick={() => navigate(`/products/${product.id}`)}
                >
                  Visa detaljer
                </Button>
              </CardActions>
            </Card>
          </Grid>
        ))}
      </Grid>
    </Box>
  );
}

export default ProductsPage;
