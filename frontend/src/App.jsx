import { BrowserRouter, Routes, Route } from "react-router-dom";
import { CssBaseline, Container } from "@mui/material";
import Navbar from "./components/Navbar";
import ProductsPage from "./pages/ProductsPage";
import ProductDetailPage from "./pages/ProductDetailPage";
import CartPage from "./pages/CartPage";
import ProductFormPage from "./pages/ProductFormPage";
import OrderConfirmationPage from "./pages/OrderConfirmationPage";
import CategoryPage from "./pages/CategoryPage";

function App() {
  return (
    <BrowserRouter>
      <CssBaseline />
      <Navbar />
      <Container maxWidth="xl" sx={{ mt: 4 }}>
        <Routes>
          {/* Startsidan – visar alla produkter */}
          <Route path="/" element={<ProductsPage />} />
          {/* Skapa ny produkt */}
          <Route path="/products/new" element={<ProductFormPage />} />
          {/* Detaljsida för en produkt */}
          <Route path="/products/:id" element={<ProductDetailPage />} />
          {/* Varukorg */}
          <Route path="/cart" element={<CartPage />} />
          {/* Redigera befintlig produkt */}
          <Route path="/products/:id/edit" element={<ProductFormPage />} />
          {/* order konfermation*/}
          <Route
            path="/order-confirmation"
            element={<OrderConfirmationPage />}
          />
          {/* kategorier */}
          <Route path="/categories" element={<CategoryPage />} />
        </Routes>
      </Container>
    </BrowserRouter>
  );
}

export default App;
