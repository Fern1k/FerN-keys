# 🔑 FerN-keys — system kluczy do pojazdów (FiveM)

FerN-keys to lekki i elastyczny system kluczy do pojazdów stworzony z myślą o serwerach RP działających na frameworku **ESX**. 
Pozwala przypisywać klucze do pojazdów, udostępniać je innym graczom oraz zarządzać dostępem w realistyczny sposób.

---

## 🚗 Funkcje

- 🔐 Dodawanie i usuwanie kluczy (exporty)
- 🚗 Otwieranie/zamykanie pojazdu (`U`)
- 🔧 Uruchamianie/zgaszanie silnika (`Y`)
- 🔍 Szukanie kluczy w pojeździe (`U`)
- 💡 Napisany pod **ESX Extended**
- 📦 Prosty w integracji z innymi systemami

---

## 🧰 Exporty

```lua
exports("addKeys", function(plate)
exports("removeKeys", function(plate)
```

## 🔧 Instalacja

1. Skopiuj folder `fern-keys` do zasobów serwera:  
   `resources/fern-keys`

2. Dodaj do `server.cfg`:
 `ensure fern-keys`

## 📥 Download

👉 [Pobierz najnowszą wersję z Releases](https://github.com/Fern1k/FerN-keys/releases)

---

## 👤 Autor

Projekt stworzony przez **[Fern1k](https://github.com/Fern1k)**  
Masz pytania lub chcesz zgłosić błąd? Otwórz [issue](https://github.com/Fern1k/FerN-keys/issues) lub napisz na Discordzie!

---

## 📄 Licencja

Ten projekt jest dostępny na licencji MIT.  
Użycie w komercyjnych serwerach dozwolone, ale nie sprzedawaj skryptu bez zgody autora.
