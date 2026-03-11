import { AppBar, Toolbar, Typography, Button, Box } from "@mui/material";
import { Link } from "react-router-dom";
import BuildIcon from "@mui/icons-material/Build";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";

// Navbar som visas längst upp på alla sidor
function Navbar() {
  return (
    <AppBar position="static">
      <Toolbar>
        {/* Logotyp/namn som länkar till startsidan */}
        <BuildIcon sx={{ mr: 1 }} />
        <Typography
          variant="h6"
          component={Link}
          to="/"
          sx={{ flexGrow: 1, textDecoration: "none", color: "inherit" }}
        >
          PowerTools
        </Typography>

        {/* Navigationslänkar */}
        <Box>
          <Button color="inherit" component={Link} to="/">
            Produkter
          </Button>
          <Button color="inherit" component={Link} to="/products/new">
            Lägg till produkt
          </Button>
          <Button
            color="inherit"
            component={Link}
            to="/cart"
            startIcon={<ShoppingCartIcon />}
          >
            Varukorg
          </Button>
        </Box>
      </Toolbar>
    </AppBar>
  );
}

export default Navbar;
