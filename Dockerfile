# 1. Obraz bazowy - lekki Linux z zainstalowanym Pythonem
FROM python:3.9-slim

# 2. Ustawiamy katalog roboczy wewnątrz kontenera (wszystko będzie się działo w folderze /app)
WORKDIR /app

# 3. Najpierw kopiujemy tylko plik z wymaganiami
COPY requirements.txt .

# 4. Instalujemy biblioteki (Flask) wewnątrz kontenera
# Robimy to przed skopiowaniem kodu, żeby Docker mógł użyć cache (szybsze budowanie)
RUN pip install --no-cache-dir -r requirements.txt

# 5. Teraz kopiujemy całą resztę projektu (app.py i folder templates) do kontenera
COPY . .

# 6. Informujemy Dockera, że aplikacja nasłuchuje na porcie 5000
EXPOSE 5000

# 7. Komenda startowa - co ma się stać po uruchomieniu kontenera
CMD ["python", "app.py"]