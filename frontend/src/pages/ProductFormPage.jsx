import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import {
  Box,
  Typography,
  TextField,
  Button,
  CircularProgress,
  Snackbar,
  Alert,
  MenuItem,
  Select,
  InputLabel,
  FormControl,
} from "@mui/material";
import {
  getProduct,
  createProduct,
  updateProduct,
  deleteProduct,
} from "../api/index";

// Samma kategorier som i navbar-menyn
const categories = [
  "Batterier & Laddare",
  "Betongvibratorer",
  "Borrhammare",
  "Slagskruvdragare",
  "Cirkelsågar",
  "Combokit",
  "Fogpistoler & tillbehör",
  "Fräsmaskiner",
  "Hyvlar",
  "Kap och Gersågar",
  "Lampor",
  "Metallsågar & Metallbearbetning",
  "Mutterdragare",
  "Nibblare och Plåtsaxar",
  "Polermaskiner",
  "Skruvautomater",
  "Slipmaskiner",
  "Dyckert & Stiftpistoler",
  "Sticksågar",
  "Tigersågar",
  "Vinkelslipar",
  "Paket",
  "Övrigt",
];

function ProductFormPage() {
  // Hämtar id från URL:en – finns inget id är vi i "skapa"-läge
  const { id } = useParams();
  const navigate = useNavigate();
  const isEditMode = Boolean(id);

  // Formulärets fält – category tillagt
  const [form, setForm] = useState({
    title: "",
    description: "",
    price: "",
    imageUrl: "",
    category: "",
  });

  const [loading, setLoading] = useState(isEditMode);
  const [snackbar, setSnackbar] = useState({
    open: false,
    message: "",
    severity: "success",
  });

  // Om vi är i redigeringsläge – hämta produkten och fyll i formuläret
  useEffect(() => {
    if (isEditMode) {
      getProduct(id)
        .then((res) => {
          const { title, description, price, imageUrl, category } = res.data;
          setForm({
            title,
            description,
            price,
            imageUrl: imageUrl || "",
            category: category || "",
          });
          setLoading(false);
        })
        .catch((err) => {
          console.error(err);
          setLoading(false);
        });
    }
  }, [id]);

  // Uppdaterar formulärets state när användaren skriver eller väljer
  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  // Skickar formuläret – skapar eller uppdaterar beroende på läge
  const handleSubmit = async () => {
    try {
      if (isEditMode) {
        await updateProduct(id, form);
        setSnackbar({
          open: true,
          message: "Produkt uppdaterad!",
          severity: "success",
        });
      } else {
        await createProduct(form);
        setSnackbar({
          open: true,
          message: "Produkt skapad!",
          severity: "success",
        });
      }
      // Navigera tillbaka till produktlistan efter 1 sekund
      setTimeout(() => navigate("/"), 1000);
    } catch (err) {
      setSnackbar({ open: true, message: "Något gick fel", severity: "error" });
    }
  };

  // Tar bort produkten och navigerar tillbaka till startsidan
  const handleDelete = async () => {
    if (window.confirm("Är du säker på att du vill ta bort produkten?")) {
      try {
        await deleteProduct(id);
        navigate("/");
      } catch (err) {
        setSnackbar({
          open: true,
          message: "Kunde inte ta bort produkten",
          severity: "error",
        });
      }
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
    <Box sx={{ maxWidth: 600 }}>
      <Typography variant="h4" sx={{ mb: 3 }}>
        {isEditMode ? "Redigera produkt" : "Lägg till produkt"}
      </Typography>

      {/* Formulärfält */}
      <TextField
        label="Titel"
        name="title"
        value={form.title}
        onChange={handleChange}
        fullWidth
        sx={{ mb: 2 }}
      />
      <TextField
        label="Beskrivning"
        name="description"
        value={form.description}
        onChange={handleChange}
        fullWidth
        multiline
        rows={3}
        sx={{ mb: 2 }}
      />
      <TextField
        label="Pris (kr)"
        name="price"
        type="number"
        value={form.price}
        onChange={handleChange}
        fullWidth
        sx={{ mb: 2 }}
      />
      <TextField
        label="Bild-URL"
        name="imageUrl"
        value={form.imageUrl}
        onChange={handleChange}
        fullWidth
        sx={{ mb: 2 }}
      />

      {/* Kategorival – dropdown med samma kategorier som i menyn */}
      <FormControl fullWidth sx={{ mb: 3 }}>
        <InputLabel>Kategori</InputLabel>
        <Select
          name="category"
          value={form.category}
          label="Kategori"
          onChange={handleChange}
        >
          {categories.map((cat) => (
            <MenuItem key={cat} value={cat}>
              {cat}
            </MenuItem>
          ))}
        </Select>
      </FormControl>

      {/* Knappar */}
      <Box sx={{ display: "flex", gap: 2 }}>
        <Button variant="contained" onClick={handleSubmit}>
          {isEditMode ? "Spara ändringar" : "Skapa produkt"}
        </Button>
        <Button variant="outlined" onClick={() => navigate("/")}>
          Avbryt
        </Button>
        {/* Ta bort-knapp visas bara i redigeringsläge */}
        {isEditMode && (
          <Button variant="outlined" color="error" onClick={handleDelete}>
            Ta bort produkt
          </Button>
        )}
      </Box>

      {/* Bekräftelse- och felmeddelanden */}
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

export default ProductFormPage;
