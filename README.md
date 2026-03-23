# Design-av-webbapplikationer

## Krav innan du börjar

Se till att du har följande installerat på din dator:

- [Node.js](https://nodejs.org/)
- [MySQL](https://dev.mysql.com/downloads/mysql/)

---

## Första gången du klonar projektet

### 1. Klona projektet

```bash
git clone <projektets-url>
cd gik2xk-grupp21-projektarbete
```

---

### 2. Installera beroenden

Installera backend-beroenden. Stå i `backend/`-mappen och kör:

```bash
npm install
```

Installera frontend-beroenden. Öppna en **ny terminal**, stå i `frontend/`-mappen och kör:

```bash
npm install
```

---

### 3. Skapa din personliga .env-fil

Stå i `backend/`-mappen och kör:

```bash
copy .env.example .env
```

Öppna sedan `.env` och ändra `DB_PASS` till ditt eget MySQL-lösenord.
Den här filen committas aldrig – varje person har sin egen lokalt.

---

### 4. Skapa databasen

> ⚠️ **Viktigt:** Dessa kommandon måste köras i **Kommandotolken (cmd)** – inte i PowerShell eller terminalen i VS Code. PowerShell stödjer inte `<`-operatorn som behövs för att importera databasen. Skriver man i terminalen/powershell så kan det krångla med encoding så (å, ä, ö) inte blir med i sql filen eller på hemsidan. Du måste ändra "DITT_ANVÄNDARNAMN" till ditt eget i kommandon nedanför.
>
> Öppna Kommandotolken: klicka på Start → sök efter **cmd** → öppna **Kommandotolken**

Navigera till projektets rotmapp:

```bash
cd C:\Users\DITT_ANVÄNDARNAMN\Documents\GitHub\gik2xk-grupp21-projektarbete
```

Skapa databasen:

```bash
mysql --default-character-set=utf8mb4 -u root -p -e "CREATE DATABASE webbshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
```

---

### 5. Importera all data

Stå i **projektets rotmapp** och kör i **cmd**:

```bash
mysql --default-character-set=utf8mb4 -u root -p webbshop < webbshop.sql
```

Skriv in ditt MySQL-lösenord när det frågas.

> ⚠️ Flaggan `--default-character-set=utf8mb4` är viktig – den ser till att åäö importeras korrekt.

---

### 6. Starta backend

Stå i `backend/`-mappen och kör:

```bash
node app.js
```

Om du ser `Databas synkad!` och `Server körs på port 3000` fungerar allt korrekt.

---

### 7. Starta frontend

Öppna en **ny terminal**, stå i `frontend/`-mappen och kör:

```bash
npm run dev
```

Frontend körs på `http://localhost:5173` och backend på `http://localhost:3000`.

---

## Innan du committar och pushar

Exportera alltid databasen med rätt encoding innan du committar.
Stå i **projektets rotmapp** och kör i **cmd** (byt ut `DITT_LÖSENORD` mot ditt eget lösenord, **inget mellanslag** efter `-p`):

```bash
mysqldump --default-character-set=utf8mb4 -u root -pDITT_LÖSENORD webbshop > webbshop.sql
```

Committa och pusha sedan:

```bash
git add webbshop.sql
git commit -m "Uppdaterar databasen"
git push
```

---

## Efter att du pullar

Om `webbshop.sql` har ändrats av någon annan behöver du importera den på nytt.
Kör detta i **cmd** från projektets rotmapp:

```bash
mysql --default-character-set=utf8mb4 -u root -p webbshop < webbshop.sql
```

Skriv in ditt MySQL-lösenord när det frågas.
