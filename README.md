# Design-av-webbapplikationer

## Importera databasen

Se till att MySQL är igång och kör sedan följande kommandon i terminalen:

1. Skapa databasen:

```bash
mysql -u root -p -e "CREATE DATABASE webbshop;"
```

2. Importera data:

```bash
mysql -u root -p webbshop < webbshop.sql
```

Skriv in lösenordet `password123` när det frågas.

3. Starta sedan backend:

```bash
cd backend
node app.js
```

4. Starta frontend i en ny terminal:

```bash
cd frontend
npm run dev
```

Frontend körs på `http://localhost:5173` och backend på `http://localhost:3000`.
