# Design-av-webbapplikationer

## Första gången du klonar projektet

### 1. Installera beroenden

Stå i `backend/`-mappen och kör:

```bash
npm install
```

### 2. Skapa din personliga .env-fil

Stå i `backend/`-mappen. Kör detta på Windows:

```bash
copy .env.example .env
```

Öppna sedan `.env` och ändra `DB_PASS` till ditt eget MySQL-lösenord.
Den här filen committas aldrig – varje person har sin egen lokalt.

### 3. Skapa databasen

Stå i **projektets rotmapp** och kör:

```bash
mysql --default-character-set=utf8mb4 -u root -p -e "CREATE DATABASE webbshop;"
```

### 4. Importera all data

Stå i **projektets rotmapp** och kör:

```bash
mysql --default-character-set=utf8mb4 -u root -p webbshop < webbshop.sql
```

Skriv in ditt MySQL-lösenord när det frågas.
Flaggan `--default-character-set=utf8mb4` är viktig – den ser till att åäö importeras korrekt.

### 5. Starta backend

Stå i `backend/`-mappen och kör:

```bash
node app.js
```

Om du ser `Databas synkad!` och `Server körs på port 3000` fungerar allt korrekt.

### 6. Starta frontend

Öppna en **ny terminal**, stå i `frontend/`-mappen och kör:

```bash
npm run dev
```

Frontend körs på `http://localhost:5173` och backend på `http://localhost:3000`.

---

## Innan du committar och pushar

Exportera alltid databasen med rätt encoding innan du committar.
Stå i **projektets rotmapp** och kör (byt ut `password123` mot ditt eget lösenord):

```bash
mysqldump --default-character-set=utf8mb4 -u root -pDITT_LÖSENORD webbshop > webbshop.sql
```

Committa och pusha sedan som vanligt.

---

## Efter att du pullar

Om `webbshop.sql` har ändrats av någon annan behöver du importera den på nytt.
Stå i **projektets rotmapp** och kör:

```bash
mysql --default-character-set=utf8mb4 -u root -p webbshop < webbshop.sql
```

Skriv in ditt MySQL-lösenord när det frågas.
