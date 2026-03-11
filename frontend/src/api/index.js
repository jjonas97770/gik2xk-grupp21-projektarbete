import axios from "axios";

// Bas-URL till vår backend
const api = axios.create({
  baseURL: "http://localhost:3000",
});

// Hämta alla produkter
export const getProducts = () => api.get("/products");

// Hämta en produkt med betyg
export const getProduct = (id) => api.get(`/products/${id}`);

// Skapa en produkt
export const createProduct = (data) => api.post("/products", data);

// Uppdatera en produkt
export const updateProduct = (id, data) => api.put(`/products/${id}`, data);

// Ta bort en produkt
export const deleteProduct = (id) => api.delete(`/products/${id}`);

// Lägg till betyg på en produkt
export const addRating = (id, rating) =>
  api.post(`/products/${id}/rating`, { rating });

// Lägg till produkt i varukorg
export const addToCart = (productId, userId, amount) =>
  api.post(`/products/${productId}/addToCart`, { userId, amount });

// Hämta varukorg för en användare
export const getCart = (userId) => api.get(`/users/${userId}/getCart`);
