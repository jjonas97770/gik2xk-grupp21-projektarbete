import { useEffect, useState } from "react";
import {
  Box,
  Typography,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  CircularProgress,
  Button,
  Snackbar,
  Alert,
} from "@mui/material";
import { useNavigate } from "react-router-dom";
import { getCart } from "../api/index";
import axios from "axios";

function CartPage() {
  const [cartItems, setCartItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [snackbar, setSnackbar] = useState({
    open: false,
    message: "",
    severity: "success",
  });
  const navigate = useNavigate();

  // Hämtar varukorgen för användare med id 1
  useEffect(() => {
    getCart(1)
      .then((res) => {
        setCartItems(res.data);
        setLoading(false);
      })
      .catch((err) => {
        console.error(err);
        setLoading(false);
      });
  }, []);

  // Räknar ut totalpriset
  const totalPrice = cartItems.reduce((sum, item) => sum + item.totalPrice, 0);

  // Genomför köpet
  const handlePay = async () => {
    try {
      await axios.post("http://localhost:3000/users/1/payCart");
      setCartItems([]);
      setSnackbar({
        open: true,
        message: "Köp genomfört, tack!",
        severity: "success",
      });
    } catch (err) {
      setSnackbar({ open: true, message: "Något gick fel", severity: "error" });
    }
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
        Min varukorg
      </Typography>

      {cartItems.length === 0 ? (
        <Box>
          <Typography>Din varukorg är tom.</Typography>
          <Button
            variant="contained"
            sx={{ mt: 2 }}
            onClick={() => navigate("/")}
          >
            Fortsätt handla
          </Button>
        </Box>
      ) : (
        <Box>
          <TableContainer component={Paper}>
            <Table>
              <TableHead>
                <TableRow>
                  <TableCell>Produkt</TableCell>
                  <TableCell align="right">Pris</TableCell>
                  <TableCell align="right">Antal</TableCell>
                  <TableCell align="right">Totalt</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {cartItems.map((item) => (
                  <TableRow key={item.id}>
                    <TableCell>{item.title}</TableCell>
                    <TableCell align="right">{item.price} kr</TableCell>
                    <TableCell align="right">{item.amount}</TableCell>
                    <TableCell align="right">
                      {item.totalPrice.toFixed(2)} kr
                    </TableCell>
                  </TableRow>
                ))}
                <TableRow>
                  <TableCell colSpan={3}>
                    <strong>Totalt</strong>
                  </TableCell>
                  <TableCell align="right">
                    <strong>{totalPrice.toFixed(2)} kr</strong>
                  </TableCell>
                </TableRow>
              </TableBody>
            </Table>
          </TableContainer>

          {/* Knappar */}
          <Box sx={{ display: "flex", gap: 2, mt: 3 }}>
            <Button variant="outlined" onClick={() => navigate("/")}>
              Fortsätt handla
            </Button>
            <Button variant="contained" color="success" onClick={handlePay}>
              Genomför köp
            </Button>
          </Box>
        </Box>
      )}

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

export default CartPage;
