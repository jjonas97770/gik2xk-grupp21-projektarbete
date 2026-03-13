import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import {
  Box,
  Typography,
  Rating,
  Button,
  CircularProgress,
  Divider,
  TextField,
  Snackbar,
  Alert,
} from "@mui/material";
import { getProduct, addRating, addToCart } from "../api/index";

function ProductDetailPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [product, setProduct] = useState(null);
  const [loading, setLoading] = useState(true);
  const [userRating, setUserRating] = useState(0);
  const [amount, setAmount] = useState(1);
  const [snackbar, setSnackbar] = useState({
    open: false,
    message: "",
    severity: "success",
  });

  // Hämta produkten med alla betyg när sidan laddas
  useEffect(() => {
    getProduct(id)
      .then((res) => {
        setProduct(res.data);
        setLoading(false);
      })
      .catch((err) => {
        console.error(err);
        setLoading(false);
      });
  }, [id]);

  // Skicka betyg till backend
  const handleRating = async (newValue) => {
    setUserRating(newValue);
    try {
      await addRating(id, newValue);
      // Uppdatera produkten så nya snittet visas
      const res = await getProduct(id);
      setProduct(res.data);
      setSnackbar({
        open: true,
        message: "Betyg sparat!",
        severity: "success",
      });
    } catch (err) {
      setSnackbar({
        open: true,
        message: "Kunde inte spara betyg",
        severity: "error",
      });
    }
  };

  // Lägg till i varukorg – använder userId 1 som hårdkodad användare
  const handleAddToCart = async () => {
    try {
      await addToCart(id, 1, amount);
      setSnackbar({
        open: true,
        message: "Tillagd i varukorgen!",
        severity: "success",
      });
    } catch (err) {
      setSnackbar({
        open: true,
        message: "Kunde inte lägga till i varukorg",
        severity: "error",
      });
    }
  };

  if (loading) {
    return (
      <Box sx={{ display: "flex", justifyContent: "center", mt: 4 }}>
        <CircularProgress />
      </Box>
    );
  }

  if (!product) return <Typography>Produkten hittades inte.</Typography>;

  return (
    <Box>
      {/* Tillbaka-knapp */}
      <Button onClick={() => navigate(-1)} sx={{ mb: 2 }}>
        ← Tillbaka
      </Button>

      <Box sx={{ display: "flex", gap: 4, flexWrap: "wrap" }}>
        {/* Produktbild */}
        <Box
          component="img"
          src={
            product.imageUrl ||
            "https://via.placeholder.com/400x300?text=Ingen+bild"
          }
          alt={product.title}
          sx={{ width: 400, height: 300, objectFit: "cover", borderRadius: 2 }}
        />

        <Box sx={{ flex: 1, minWidth: 250 }}>
          <Typography variant="h4">{product.title}</Typography>
          <Typography variant="body1" sx={{ mt: 1, mb: 2 }}>
            {product.description}
          </Typography>
          <Typography variant="h5" color="primary" sx={{ mb: 2 }}>
            {product.price} kr
          </Typography>

          {/* Snittbetyg */}
          <Typography variant="subtitle1">
            Snittbetyg:{" "}
            {product.avgRating ? product.avgRating.toFixed(1) : "Inga betyg än"}
          </Typography>
          <Rating value={product.avgRating || 0} precision={0.5} readOnly />

          <Divider sx={{ my: 2 }} />

          {/* Sätt betyg */}
          <Typography variant="subtitle1">Sätt ditt betyg:</Typography>
          <Rating
            value={userRating}
            onChange={(e, newValue) => handleRating(newValue)}
          />

          <Divider sx={{ my: 2 }} />

          {/* Lägg i varukorg */}
          <Box sx={{ display: "flex", alignItems: "center", gap: 2 }}>
            <TextField
              label="Antal"
              type="number"
              value={amount}
              onChange={(e) => setAmount(Number(e.target.value))}
              inputProps={{ min: 1 }}
              size="small"
              sx={{ width: 80 }}
            />
            <Button variant="contained" onClick={handleAddToCart}>
              Lägg i varukorg
            </Button>
          </Box>

          {/* Redigera/ta bort knappar */}
          <Box sx={{ mt: 3, display: "flex", gap: 2 }}>
            <Button
              variant="outlined"
              onClick={() => navigate(`/products/${id}/edit`)}
            >
              Redigera produkt
            </Button>
          </Box>
        </Box>
      </Box>

      <Divider sx={{ my: 4 }} />

      {/* Lista av alla betyg */}
      <Typography variant="h6">
        Alla betyg ({product.Ratings?.length || 0})
      </Typography>
      {product.Ratings?.length === 0 && <Typography>Inga betyg än.</Typography>}
      {product.Ratings?.map((r) => (
        <Box
          key={r.id}
          sx={{ display: "flex", alignItems: "center", gap: 1, mt: 1 }}
        >
          <Rating value={r.rating} readOnly size="small" />
          <Typography variant="body2">{r.rating} stjärnor</Typography>
        </Box>
      ))}

      {/* Bekräftelsemeddelande */}
      <Snackbar
        open={snackbar.open}
        autoHideDuration={3000}
        onClose={() => setSnackbar({ ...snackbar, open: false })}
      >
        <Alert severity={snackbar.severity}>{snackbar.message}</Alert>
      </Snackbar>
    </Box>
  );
}

export default ProductDetailPage;
