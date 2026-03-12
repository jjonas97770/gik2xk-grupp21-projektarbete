import { Box, Typography, Button, Divider } from "@mui/material";
import { useLocation, useNavigate } from "react-router-dom";
import CheckCircleIcon from "@mui/icons-material/CheckCircle";

function OrderConfirmationPage() {
  const { state } = useLocation();
  const navigate = useNavigate();

  // Hämtar orderinfo som skickades med från CartPage
  const { cartItems, totalPrice } = state || { cartItems: [], totalPrice: 0 };

  return (
    <Box sx={{ textAlign: "center", mt: 4 }}>
      {/* Bekräftelseikon */}
      <CheckCircleIcon sx={{ fontSize: 80, color: "success.main", mb: 2 }} />
      <Typography variant="h4" sx={{ mb: 1 }}>
        Tack för ditt köp!
      </Typography>
      <Typography variant="body1" color="text.secondary" sx={{ mb: 3 }}>
        Din beställning är genomförd.
      </Typography>

      <Divider sx={{ mb: 3 }} />

      {/* Ordersammanfattning */}
      <Typography variant="h6" sx={{ mb: 2 }}>
        Ordersammanfattning
      </Typography>
      {cartItems.map((item) => (
        <Box
          key={item.id}
          sx={{
            display: "flex",
            justifyContent: "space-between",
            mb: 1,
            maxWidth: 400,
            mx: "auto",
          }}
        >
          <Typography>
            {item.title} x{item.amount}
          </Typography>
          <Typography>{item.totalPrice.toFixed(2)} kr</Typography>
        </Box>
      ))}

      <Divider sx={{ my: 2, maxWidth: 400, mx: "auto" }} />
      <Typography variant="h6" sx={{ mb: 3 }}>
        Totalt: {totalPrice.toFixed(2)} kr
      </Typography>

      <Button variant="contained" onClick={() => navigate("/")}>
        Fortsätt handla
      </Button>
    </Box>
  );
}

export default OrderConfirmationPage;
