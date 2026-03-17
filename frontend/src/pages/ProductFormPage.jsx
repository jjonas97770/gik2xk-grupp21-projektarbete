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
  FormControlLabel, // Wrapper som kopplar ihop en label med en kontroll (t.ex. Switch)
  Switch, // Toggle-knapp för på/av – används för rea-flaggan
} from "@mui/material";
import {
  getProduct,
  createProduct,
  updateProduct,
  deleteProduct,
} from "../api/index";

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
  const { id } = useParams();
  const navigate = useNavigate();
  const isEditMode = Boolean(id);

  // Formulärets state – nu med onSale (boolean) och originalPrice (tal)
  // onSale styr om produkten visas i rea-sektionen på framsidan
  // originalPrice är det gamla priset som visas överstruket bredvid rea-priset
  const [form, setForm] = useState({
    title: "",
    description: "",
    price: "",
    imageUrl: "",
    category: "",
    onSale: false, // false = inte på rea, true = visas i rea-sektionen
    originalPrice: "", // lämnas tomt om produkten inte är på rea
  });

  const [loading, setLoading] = useState(isEditMode);
  const [snackbar, setSnackbar] = useState({
    open: false,
    message: "",
    severity: "success",
  });

  // Hämtar befintlig produktdata när vi är i redigeringsläge
  // Plockar nu även ut onSale och originalPrice från svaret
  useEffect(() => {
    if (isEditMode) {
      getProduct(id)
        .then((res) => {
          const {
            title,
            description,
            price,
            imageUrl,
            category,
            onSale,
            originalPrice,
            featuredSale,
          } = res.data;

          setForm({
            title,
            description,
            price,
            imageUrl: imageUrl || "",
            category: category || "",
            onSale: onSale || false, // fallback till false om fältet saknas
            originalPrice: originalPrice || "", // fallback till tomt om fältet saknas
            featuredSale: featuredSale || false,
          });
          setLoading(false);
        })
        .catch((err) => {
          console.error(err);
          setLoading(false);
        });
    }
  }, [id]);

  // Hanterar ändringar i alla formulärfält
  // Checkboxar och switchar använder "checked" istället för "value",
  // så vi kollar type för att veta vilket vi ska spara
  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setForm({
      ...form,
      [name]: type === "checkbox" ? checked : value,
    });
  };

  // Skickar formuläret – skapar eller uppdaterar beroende på läge
  // form-objektet innehåller nu automatiskt onSale och originalPrice
  const handleSubmit = async () => {
    try {
      if (isEditMode) {
        await updateProduct(id, form);
        setSnackbar({
          open: true,
          message: "Produkt uppdaterad!",
          severity: "success",
        });
        setTimeout(() => navigate(-2), 1000);
      } else {
        await createProduct(form);
        setSnackbar({
          open: true,
          message: "Produkt skapad!",
          severity: "success",
        });
        setTimeout(() => navigate("/"), 1000);
      }
    } catch (err) {
      setSnackbar({ open: true, message: "Något gick fel", severity: "error" });
    }
  };

  // Tar bort produkten och navigerar tillbaka
  const handleDelete = async () => {
    if (window.confirm("Är du säker på att du vill ta bort produkten?")) {
      try {
        await deleteProduct(id);
        navigate(-2);
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

      {/* Vanliga produktfält – oförändrade */}
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

      {/* Kategoridropdown – oförändrad */}
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

      {/* REA-TOGGLE
          FormControlLabel kopplar ihop switchen med texten "På rea"
          Switch är själva toggle-knappen – name="onSale" matchar form-state
          checked={form.onSale} gör att den visar rätt läge när man redigerar */}
      <FormControlLabel
        control={
          <Switch
            name="onSale"
            checked={form.onSale}
            onChange={handleChange}
            sx={{
              // Röd färg på switchen när den är aktiv – matchar sidans färgtema
              "& .MuiSwitch-switchBase.Mui-checked": { color: "#e31837" },
              "& .MuiSwitch-switchBase.Mui-checked + .MuiSwitch-track": {
                bgcolor: "#e31837",
              },
            }}
          />
        }
        label="På rea"
        sx={{ mb: 2 }}
      />

      {/* Visa på framsidan-toggle – syns bara om produkten är på rea */}
      {form.onSale && (
        <FormControlLabel
          control={
            <Switch
              name="featuredSale"
              checked={form.featuredSale}
              onChange={handleChange}
              sx={{
                "& .MuiSwitch-switchBase.Mui-checked": { color: "#e31837" },
                "& .MuiSwitch-switchBase.Mui-checked + .MuiSwitch-track": {
                  bgcolor: "#e31837",
                },
              }}
            />
          }
          label="Visa i rea-sektionen på framsidan"
          sx={{ mb: 2, display: "block" }}
        />
      )}

      {/* ORIGINALPRIS-FÄLT
          Visas endast om onSale är true – annars är det irrelevant
          Värdet sparas som originalPrice i databasen och visas
          överstruket bredvid rea-priset på framsidan */}
      {form.onSale && (
        <TextField
          label="Rea pris (kr)"
          name="originalPrice"
          type="number"
          value={form.originalPrice}
          onChange={handleChange}
          fullWidth
          sx={{ mb: 3 }}
          helperText="Det nya lägre priset – visas i rött"
        />
      )}

      {/* Åtgärdsknappar */}
      <Box sx={{ display: "flex", gap: 2 }}>
        <Button variant="contained" onClick={handleSubmit}>
          {isEditMode ? "Spara ändringar" : "Skapa produkt"}
        </Button>
        <Button variant="outlined" onClick={() => navigate(-1)}>
          Avbryt
        </Button>
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
