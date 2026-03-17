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
  TextField,
  Alert,
} from "@mui/material";
import { useNavigate, useSearchParams } from "react-router-dom";
import { getProducts, getReviews, createReview } from "../api/index";

function ProductsPage() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
  });
  const [formSent, setFormSent] = useState(false);
  // State för recensioner från databasen
  const [reviews, setReviews] = useState([]);
  // State för om alla recensioner visas eller bara de tre första
  const [showAllReviews, setShowAllReviews] = useState(false);
  // State för formuläret för ny recension
  const [reviewForm, setReviewForm] = useState({
    name: "",
    rating: 5,
    message: "",
  });
  // State för om recensionsformuläret skickats
  const [reviewSent, setReviewSent] = useState(false);

  // Räknar ut snittbetyget för alla recensioner
  const avgReviewRating = reviews.length
    ? (reviews.reduce((sum, r) => sum + r.rating, 0) / reviews.length).toFixed(
        1,
      )
    : null;

  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const category = searchParams.get("category");

  // Hämtar produkter och recensioner från backend när sidan laddas
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

    getReviews()
      .then((res) => setReviews(res.data))
      .catch((err) => console.error(err));
  }, []);

  const filteredProducts = category
    ? products.filter((p) => p.category === category)
    : products;

  // Visar produkter som är markerade för framsidan, max 6 stycken
  const saleProducts = products.filter((p) => p.featuredSale).slice(0, 6);

  // Uppdaterar kontaktformulärets state när användaren skriver
  const handleFormChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  // Hanterar inlämning av kontaktformuläret
  const handleFormSubmit = () => {
    if (formData.name && formData.email && formData.message) {
      setFormSent(true);
      setFormData({ name: "", email: "", message: "" });
    }
  };

  // Uppdaterar recensionsformulärets state när användaren skriver
  const handleReviewChange = (e) => {
    setReviewForm({ ...reviewForm, [e.target.name]: e.target.value });
  };

  // Skickar recensionen till backend och uppdaterar listan
  const handleReviewSubmit = () => {
    if (reviewForm.name && reviewForm.rating && reviewForm.message) {
      createReview({ ...reviewForm, rating: Number(reviewForm.rating) })
        .then((res) => {
          setReviews([res.data, ...reviews]);
          setReviewSent(true);
          setReviewForm({ name: "", rating: 5, message: "" });
          setTimeout(() => setReviewSent(false), 3000);
        })
        .catch((err) => console.error(err));
    }
  };

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
            {/* width: 100% och margin: 0 borttaget – det orsakade att korten staplade sig vertikalt */}
            <Grid container spacing={3} sx={{ alignItems: "stretch" }}>
              {saleProducts.map((product) => (
                <Grid
                  item
                  xs={12}
                  sm={4}
                  key={product.id}
                  sx={{ display: "flex", alignItems: "stretch" }}
                >
                  <Card
                    sx={{
                      width: "100%",
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
                        height="220"
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
                      {/* Beskrivningen klipps av efter 2 rader för enhetlig höjd */}
                      <Typography
                        variant="body2"
                        color="text.secondary"
                        sx={{
                          mb: 1,
                          overflow: "hidden",
                          display: "-webkit-box",
                          WebkitLineClamp: 2,
                          WebkitBoxOrient: "vertical",
                        }}
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
                          {product.originalPrice} kr
                        </Typography>
                        <Typography
                          sx={{
                            color: "text.secondary",
                            textDecoration: "line-through",
                            fontSize: "0.9rem",
                          }}
                        >
                          {product.price} kr
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

          {/* Recensionssektion */}
          <Box sx={{ mb: 6 }}>
            <Box sx={{ display: "flex", alignItems: "center", gap: 2, mb: 3 }}>
              <Typography
                variant="h5"
                sx={{ fontWeight: 800, textTransform: "uppercase" }}
              >
                ⭐ Kundrecensioner
              </Typography>
              <Chip
                label={`${reviews.length} RECENSIONER`}
                sx={{
                  bgcolor: "#e31837",
                  color: "#fff",
                  fontWeight: 700,
                  borderRadius: 0,
                }}
              />
              {avgReviewRating && (
                <Typography sx={{ fontWeight: 700, color: "text.secondary" }}>
                  {avgReviewRating} / 5
                </Typography>
              )}
            </Box>

            {/* Visa de tre första recensionerna, eller alla om showAllReviews är true */}
            <Grid
              container
              spacing={3}
              sx={{ mb: 3, width: "100%", margin: 0 }}
            >
              {(showAllReviews ? reviews : reviews.slice(0, 3)).map(
                (review) => (
                  <Grid
                    item
                    xs={12}
                    sm={4}
                    key={review.id}
                    sx={{ display: "flex" }}
                  >
                    <Card
                      sx={{
                        width: "100%",
                        borderRadius: 0,
                        boxShadow: "0 2px 12px rgba(0,0,0,0.08)",
                      }}
                    >
                      <CardContent>
                        <Box
                          sx={{
                            display: "flex",
                            justifyContent: "space-between",
                            alignItems: "center",
                            mb: 1,
                          }}
                        >
                          <Typography sx={{ fontWeight: 700 }}>
                            {review.name}
                          </Typography>
                          <Typography
                            sx={{ color: "#e31837", fontWeight: 800 }}
                          >
                            {"⭐".repeat(review.rating)}
                          </Typography>
                        </Box>
                        <Typography variant="body2" color="text.secondary">
                          {review.message}
                        </Typography>
                      </CardContent>
                    </Card>
                  </Grid>
                ),
              )}
            </Grid>

            {/* Visa fler/färre knapp – visas bara om det finns fler än 3 recensioner */}
            {reviews.length > 3 && (
              <Button
                onClick={() => setShowAllReviews(!showAllReviews)}
                sx={{ color: "#e31837", fontWeight: 700, mb: 3, mt: 2 }}
              >
                {showAllReviews
                  ? "← Visa färre"
                  : `Visa alla ${reviews.length} recensioner →`}
              </Button>
            )}

            {/* Formulär för att lämna en ny recension */}
            <Box sx={{ maxWidth: 600, mt: 2 }}>
              <Typography
                variant="h6"
                sx={{ fontWeight: 800, mb: 2, textTransform: "uppercase" }}
              >
                Lämna en recension
              </Typography>
              {reviewSent ? (
                <Alert severity="success" sx={{ borderRadius: 0 }}>
                  Tack för din recension!
                </Alert>
              ) : (
                <Box sx={{ display: "flex", flexDirection: "column", gap: 2 }}>
                  <TextField
                    name="name"
                    label="Namn"
                    value={reviewForm.name}
                    onChange={handleReviewChange}
                    variant="outlined"
                    size="small"
                  />
                  <TextField
                    name="rating"
                    label="Betyg (1-5)"
                    value={reviewForm.rating}
                    onChange={handleReviewChange}
                    variant="outlined"
                    size="small"
                    type="number"
                    inputProps={{ min: 1, max: 5 }}
                  />
                  <TextField
                    name="message"
                    label="Din recension"
                    value={reviewForm.message}
                    onChange={handleReviewChange}
                    variant="outlined"
                    multiline
                    rows={3}
                  />
                  <Button
                    variant="contained"
                    onClick={handleReviewSubmit}
                    sx={{
                      bgcolor: "#e31837",
                      color: "#fff",
                      fontWeight: 700,
                      borderRadius: 0,
                      width: "fit-content",
                      "&:hover": { bgcolor: "#b5102a" },
                    }}
                  >
                    Skicka recension
                  </Button>
                </Box>
              )}
            </Box>
          </Box>

          {/* Kontaktformulär */}
          <Box
            sx={{
              width: "100vw",
              left: "50%",
              position: "relative",
              transform: "translateX(-50%)",
              bgcolor: "#1a1a1a",
              py: 8,
              px: { xs: 3, md: 8 },
              mt: 6,
            }}
          >
            <Box sx={{ maxWidth: 600, mx: "auto" }}>
              <Chip
                label="KONTAKT"
                sx={{
                  bgcolor: "#e31837",
                  color: "#fff",
                  fontWeight: 700,
                  fontSize: "0.7rem",
                  letterSpacing: 2,
                  mb: 2,
                  borderRadius: 0,
                }}
              />
              <Typography
                variant="h4"
                sx={{
                  color: "#fff",
                  fontWeight: 900,
                  textTransform: "uppercase",
                  mb: 1,
                }}
              >
                Kontakta oss
              </Typography>
              <Typography sx={{ color: "rgba(255,255,255,0.6)", mb: 4 }}>
                Har du frågor om våra produkter? Hör av dig så återkommer vi så
                snart som möjligt.
              </Typography>
              {formSent ? (
                <Alert severity="success" sx={{ borderRadius: 0 }}>
                  Tack! Vi återkommer till dig inom kort.
                </Alert>
              ) : (
                <Box sx={{ display: "flex", flexDirection: "column", gap: 2 }}>
                  <TextField
                    name="name"
                    label="Namn"
                    value={formData.name}
                    onChange={handleFormChange}
                    variant="filled"
                    sx={{ bgcolor: "#fff", borderRadius: 0 }}
                  />
                  <TextField
                    name="email"
                    label="E-post"
                    value={formData.email}
                    onChange={handleFormChange}
                    variant="filled"
                    sx={{ bgcolor: "#fff", borderRadius: 0 }}
                  />
                  <TextField
                    name="message"
                    label="Meddelande"
                    value={formData.message}
                    onChange={handleFormChange}
                    variant="filled"
                    multiline
                    rows={4}
                    sx={{ bgcolor: "#fff", borderRadius: 0 }}
                  />
                  <Button
                    variant="contained"
                    onClick={handleFormSubmit}
                    sx={{
                      bgcolor: "#e31837",
                      color: "#fff",
                      fontWeight: 700,
                      py: 1.5,
                      borderRadius: 0,
                      fontSize: "0.95rem",
                      letterSpacing: 1,
                      "&:hover": { bgcolor: "#b5102a" },
                    }}
                  >
                    Skicka meddelande
                  </Button>
                </Box>
              )}
            </Box>
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
          {/* Produktkort i bredd – xs=12 (mobil), sm=6 (surfplatta), md=4 (dator) */}
          <Grid container spacing={3} sx={{ width: "100%", margin: 0 }}>
            {filteredProducts.map((product) => (
              <Grid
                item
                xs={12}
                sm={6}
                md={4}
                key={product.id}
                sx={{ display: "flex" }}
              >
                <Card
                  sx={{
                    width: "100%",
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
                    height="220"
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
                    {/* Beskrivningen klipps av efter 2 rader för enhetlig höjd */}
                    <Typography
                      variant="body2"
                      color="text.secondary"
                      sx={{
                        mb: 1,
                        overflow: "hidden",
                        display: "-webkit-box",
                        WebkitLineClamp: 2,
                        WebkitBoxOrient: "vertical",
                      }}
                    >
                      {product.description}
                    </Typography>
                    {/* Visar rea-pris och överstruket ordinarie pris om produkten är på rea,
    annars visas bara det vanliga priset */}
                    <Box sx={{ display: "flex", alignItems: "center", gap: 1 }}>
                      <Typography
                        sx={{
                          color: "#e31837",
                          fontWeight: 800,
                          fontSize: "1.1rem",
                        }}
                      >
                        {product.onSale ? product.originalPrice : product.price}{" "}
                        kr
                      </Typography>
                      {product.onSale && (
                        <Typography
                          sx={{
                            color: "text.secondary",
                            textDecoration: "line-through",
                            fontSize: "0.9rem",
                          }}
                        >
                          {product.price} kr
                        </Typography>
                      )}
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
        </>
      )}
    </Box>
  );
}

export default ProductsPage;
