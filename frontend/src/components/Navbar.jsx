import { useState } from "react";
import {
  AppBar,
  Toolbar,
  Typography,
  Button,
  Box,
  Menu,
  MenuItem,
  Divider,
} from "@mui/material";
import { Link, useNavigate } from "react-router-dom";
import BuildIcon from "@mui/icons-material/Build";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import KeyboardArrowDownIcon from "@mui/icons-material/KeyboardArrowDown";
import KeyboardArrowRightIcon from "@mui/icons-material/KeyboardArrowRight";

// Menystruktur: Märke -> Serie -> Kategorier
const menuStructure = {
  Milwaukee: {
    "Milwaukee M18": [
      "Borrhammare",
      "Slagskruvdragare",
      "Cirkelsågar",
      "Tigersågar",
      "Vinkelslipar",
      "Paket",
      "Övrigt",
    ],
  },
};

function Navbar() {
  // Styr vilken meny som är öppen
  const [brandAnchor, setBrandAnchor] = useState(null);
  const [seriesAnchor, setSeriesAnchor] = useState(null);
  const [categoryAnchor, setCategoryAnchor] = useState(null);
  const [activeSeries, setActiveSeries] = useState(null);
  const navigate = useNavigate();

  // Öppna märkesmenyn (nivå 1)
  const handleBrandOpen = (e) => setBrandAnchor(e.currentTarget);

  // Stäng alla menyer
  const handleCloseAll = () => {
    setBrandAnchor(null);
    setSeriesAnchor(null);
    setCategoryAnchor(null);
    setActiveSeries(null);
  };

  // Öppna seriemenyn (nivå 2) när man klickar på ett märke
  const handleSeriesOpen = (e) => {
    setSeriesAnchor(e.currentTarget);
    setBrandAnchor(null);
  };

  // Öppna kategorimenyn (nivå 3) när man klickar på en serie
  const handleCategoryOpen = (e, series) => {
    setActiveSeries(series);
    setCategoryAnchor(e.currentTarget);
    setSeriesAnchor(null);
  };

  // Navigera till filtrerad produktsida och stäng alla menyer
  const handleCategoryClick = (category) => {
    handleCloseAll();
    navigate(`/?category=${encodeURIComponent(category)}`);
  };

  return (
    <AppBar position="static">
      <Toolbar>
        {/* Logotyp */}
        <BuildIcon sx={{ mr: 1 }} />
        <Typography
          variant="h6"
          component={Link}
          to="/"
          sx={{ flexGrow: 1, textDecoration: "none", color: "inherit" }}
        >
          PowerTools
        </Typography>

        {/* Nivå 1 – Produkter-knapp */}
        <Button
          color="inherit"
          onClick={handleBrandOpen}
          endIcon={<KeyboardArrowDownIcon />}
        >
          Produkter
        </Button>

        {/* Nivå 1 – Märkesmeny */}
        <Menu
          anchorEl={brandAnchor}
          open={Boolean(brandAnchor)}
          onClose={handleCloseAll}
        >
          {Object.keys(menuStructure).map((brand) => (
            <MenuItem
              key={brand}
              onClick={handleSeriesOpen}
              sx={{ minWidth: 180 }}
            >
              {brand}
              <KeyboardArrowRightIcon sx={{ ml: "auto" }} />
            </MenuItem>
          ))}
          <Divider />
          <MenuItem
            onClick={() => {
              handleCloseAll();
              navigate("/");
            }}
          >
            Visa alla produkter
          </MenuItem>
        </Menu>

        {/* Nivå 2 – Seriemeny (t.ex. Milwaukee M18) */}
        <Menu
          anchorEl={seriesAnchor}
          open={Boolean(seriesAnchor)}
          onClose={handleCloseAll}
          anchorOrigin={{ vertical: "top", horizontal: "right" }}
          transformOrigin={{ vertical: "top", horizontal: "left" }}
        >
          {Object.keys(menuStructure["Milwaukee"]).map((series) => (
            <MenuItem
              key={series}
              onClick={(e) => handleCategoryOpen(e, series)}
              sx={{ minWidth: 180 }}
            >
              {series}
              <KeyboardArrowRightIcon sx={{ ml: "auto" }} />
            </MenuItem>
          ))}
        </Menu>

        {/* Nivå 3 – Kategorimenyn */}
        <Menu
          anchorEl={categoryAnchor}
          open={Boolean(categoryAnchor)}
          onClose={handleCloseAll}
          anchorOrigin={{ vertical: "top", horizontal: "right" }}
          transformOrigin={{ vertical: "top", horizontal: "left" }}
        >
          {activeSeries &&
            menuStructure["Milwaukee"][activeSeries].map((cat) => (
              <MenuItem
                key={cat}
                onClick={() => handleCategoryClick(cat)}
                sx={{ minWidth: 180 }}
              >
                {cat}
              </MenuItem>
            ))}
        </Menu>

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
      </Toolbar>
    </AppBar>
  );
}

export default Navbar;
