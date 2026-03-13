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
  Chip,
} from "@mui/material";
import { useNavigate, useSearchParams } from "react-router-dom";
import { getProducts } from "../api/index";

function ProductsPage() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

  const [searchParams] = useSearchParams();
  const category = searchParams.get("category");

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

  const filteredProducts = category
    ? products.filter((p) => p.category === category)
    : products;

  // Hämta rea-produkter från databasen
  const saleProducts = products
    .filter((p) => [21, 37, 63].includes(p.id))
    .slice(0, 3);

  if (loading) {
    return (
      <Box sx={{ display: "flex", justifyContent: "center", mt: 4 }}>
        <CircularProgress sx={{ color: "#e31837" }} />
      </Box>
    );
  }

  return (
    <Box>
      {!category && (
        <>
          {/* Hero-banner */}
          <Box
            sx={{
              position: "relative",
              width: "100vw",
              left: "50%",
              transform: "translateX(-50%)",
              height: { xs: "300px", md: "480px" },
              mb: 6,
              overflow: "hidden",
            }}
          >
            <Box
              component="img"
              src="/images/hero.webp"
              alt="Milwaukee M18"
              sx={{
                width: "100%",
                height: "100%",
                objectFit: "cover",
                objectPosition: "center",
                display: "block",
              }}
            />
            <Box
              sx={{
                position: "absolute",
                inset: 0,
                background:
                  "linear-gradient(to right, rgba(0,0,0,0.75) 0%, rgba(0,0,0,0.2) 60%, rgba(0,0,0,0.05) 100%)",
              }}
            />
            <Box
              sx={{
                position: "absolute",
                inset: 0,
                display: "flex",
                flexDirection: "column",
                justifyContent: "center",
                px: { xs: 3, md: 8 },
              }}
            >
              <Chip
                label="MILWAUKEE® M18™"
                sx={{
                  bgcolor: "#e31837",
                  color: "#fff",
                  fontWeight: 700,
                  fontSize: "0.7rem",
                  letterSpacing: 2,
                  mb: 2,
                  width: "fit-content",
                  borderRadius: 0,
                }}
              />
              <Typography
                variant="h2"
                sx={{
                  color: "#fff",
                  fontWeight: 900,
                  fontSize: { xs: "2rem", md: "3.5rem" },
                  lineHeight: 1.1,
                  textTransform: "uppercase",
                  letterSpacing: -1,
                  textShadow: "0 2px 20px rgba(0,0,0,0.5)",
                  mb: 2,
                }}
              >
                Professionell kraft.
                <br />
                Utan kompromisser.
              </Typography>
              <Typography
                sx={{
                  color: "rgba(255,255,255,0.85)",
                  fontSize: { xs: "0.95rem", md: "1.1rem" },
                  mb: 3,
                  maxWidth: 420,
                }}
              >
                Hela M18-sortimentet på ett ställe – verktyg byggda för proffs.
              </Typography>
              <Button
                variant="contained"
                onClick={() => navigate("/categories")}
                sx={{
                  bgcolor: "#e31837",
                  color: "#fff",
                  fontWeight: 700,
                  px: 4,
                  py: 1.5,
                  borderRadius: 0,
                  width: "fit-content",
                  fontSize: "0.95rem",
                  letterSpacing: 1,
                  "&:hover": { bgcolor: "#b5102a" },
                }}
              >
                Utforska kategorier →
              </Button>
            </Box>
          </Box>

          {/* Rea-sektion */}
          <Box sx={{ mb: 6 }}>
            <Box sx={{ display: "flex", alignItems: "center", gap: 2, mb: 3 }}>
              <Typography
                variant="h5"
                sx={{ fontWeight: 800, textTransform: "uppercase" }}
              >
                🔥 Veckans rea
              </Typography>
              <Chip
                label="SPARA UPP TILL 15%"
                sx={{
                  bgcolor: "#e31837",
                  color: "#fff",
                  fontWeight: 700,
                  borderRadius: 0,
                }}
              />
            </Box>
            <Grid container spacing={3}>
              {saleProducts.map((product) => (
                <Grid item xs={12} sm={6} md={4} key={product.id}>
                  <Card
                    sx={{
                      height: "100%",
                      display: "flex",
                      flexDirection: "column",
                      borderRadius: 0,
                      border: "2px solid #e31837",
                      boxShadow: "0 4px 20px rgba(227,24,55,0.15)",
                      transition: "transform 0.2s, box-shadow 0.2s",
                      "&:hover": {
                        transform: "translateY(-4px)",
                        boxShadow: "0 8px 28px rgba(227,24,55,0.25)",
                      },
                    }}
                  >
                    <Box sx={{ position: "relative" }}>
                      <CardMedia
                        component="img"
                        height="200"
                        image={
                          product.imageUrl ||
                          "https://placehold.co/300x200?text=Milwaukee"
                        }
                        alt={product.title}
                        onError={(e) => {
                          e.target.src =
                            "https://placehold.co/300x200?text=Milwaukee";
                        }}
                        sx={{
                          objectFit: "contain",
                          backgroundColor: "#f5f5f5",
                          p: 2,
                        }}
                      />
                      <Chip
                        label="REA"
                        sx={{
                          position: "absolute",
                          top: 12,
                          left: 12,
                          bgcolor: "#e31837",
                          color: "#fff",
                          fontWeight: 900,
                          borderRadius: 0,
                          fontSize: "0.8rem",
                        }}
                      />
                    </Box>
                    <CardContent sx={{ flexGrow: 1 }}>
                      <Typography
                        variant="h6"
                        sx={{ fontWeight: 700, fontSize: "0.95rem", mb: 0.5 }}
                      >
                        {product.title}
                      </Typography>
                      <Typography
                        variant="body2"
                        color="text.secondary"
                        sx={{ mb: 1 }}
                      >
                        {product.description}
                      </Typography>
                      <Box
                        sx={{ display: "flex", alignItems: "center", gap: 1 }}
                      >
                        <Typography
                          sx={{
                            color: "#e31837",
                            fontWeight: 800,
                            fontSize: "1.3rem",
                          }}
                        >
                          {product.price} kr
                        </Typography>
                        <Typography
                          sx={{
                            color: "text.secondary",
                            textDecoration: "line-through",
                            fontSize: "0.9rem",
                          }}
                        >
                          {product.originalPrice} kr
                        </Typography>
                      </Box>
                    </CardContent>
                    <CardActions sx={{ px: 2, pb: 2 }}>
                      <Button
                        size="small"
                        variant="contained"
                        onClick={() => navigate(`/products/${product.id}`)}
                        sx={{
                          bgcolor: "#e31837",
                          borderRadius: 0,
                          fontWeight: 700,
                          "&:hover": { bgcolor: "#b5102a" },
                        }}
                      >
                        Visa detaljer
                      </Button>
                    </CardActions>
                  </Card>
                </Grid>
              ))}
            </Grid>
          </Box>
        </>
      )}

      {/* Kategorisida */}
      {category && (
        <>
          <Typography variant="h4" sx={{ mb: 1, fontWeight: 800 }}>
            {category}
          </Typography>
          <Button sx={{ mb: 3, color: "#e31837" }} onClick={() => navigate(-1)}>
            ← Tillbaka
          </Button>
          <Grid container spacing={3}>
            {filteredProducts.map((product) => (
              <Grid item xs={12} sm={6} md={4} key={product.id}>
                <Card
                  sx={{
                    height: "100%",
                    display: "flex",
                    flexDirection: "column",
                    borderRadius: 0,
                    boxShadow: "0 2px 12px rgba(0,0,0,0.08)",
                    transition: "transform 0.2s, box-shadow 0.2s",
                    "&:hover": {
                      transform: "translateY(-4px)",
                      boxShadow: "0 8px 24px rgba(0,0,0,0.15)",
                    },
                  }}
                >
                  <CardMedia
                    component="img"
                    height="200"
                    image={
                      product.imageUrl ||
                      "https://placehold.co/300x200?text=Milwaukee"
                    }
                    alt={product.title}
                    onError={(e) => {
                      e.target.src =
                        "https://placehold.co/300x200?text=Milwaukee";
                    }}
                    sx={{
                      objectFit: "contain",
                      backgroundColor: "#f5f5f5",
                      p: 2,
                    }}
                  />
                  <CardContent sx={{ flexGrow: 1 }}>
                    <Typography
                      variant="h6"
                      sx={{ fontWeight: 700, fontSize: "0.95rem", mb: 0.5 }}
                    >
                      {product.title}
                    </Typography>
                    <Typography
                      variant="body2"
                      color="text.secondary"
                      sx={{ mb: 1 }}
                    >
                      {product.description}
                    </Typography>
                    <Typography
                      sx={{
                        color: "#e31837",
                        fontWeight: 800,
                        fontSize: "1.1rem",
                      }}
                    >
                      {product.price} kr
                    </Typography>
                  </CardContent>
                  <CardActions sx={{ px: 2, pb: 2 }}>
                    <Button
                      size="small"
                      variant="contained"
                      onClick={() => navigate(`/products/${product.id}`)}
                      sx={{
                        bgcolor: "#e31837",
                        borderRadius: 0,
                        fontWeight: 700,
                        "&:hover": { bgcolor: "#b5102a" },
                      }}
                    >
                      Visa detaljer
                    </Button>
                  </CardActions>
                </Card>
              </Grid>
            ))}
          </Grid>
        </>
      )}
    </Box>
  );
}

export default ProductsPage;
