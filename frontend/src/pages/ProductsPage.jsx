import { useEffect, useState } from "react";
import {
  Grid,
  Card,
  CardContent,
  CardMedia,
  CardActions,
  Typography,
  Button,
  Rating,
  CircularProgress,
  Box,
} from "@mui/material";
import { useNavigate } from "react-router-dom";
import { getProducts } from "../api/index";

function ProductsPage() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

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
      <Typography variant="h4" sx={{ mb: 3 }}>
        Våra verktyg
      </Typography>
      <Grid container spacing={3}>
        {products.map((product) => (
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
                {/* Knapp för att se mer detaljer */}
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
