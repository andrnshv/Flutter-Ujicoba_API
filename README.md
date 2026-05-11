Flutter

# Uji coba API Login menggunakan Firebase dan Weather App

1. **Create Main Layout**: Desain UI Login dan Weather.
2. **Setup Firebase Project**: Buat proyek di Firebase Console.
3. **Connect Flutter to Firebase**: Konfigurasi aplikasi dengan `flutterfire`.
4. **Add Dependencies**: Tambahkan package `firebase_core` dan `firebase_auth`.
5. **Initialize Firebase**: Panggil `Firebase.initializeApp()` di `main()`.
6. **Create Login Function**: Implementasi logika autentikasi user.
7. **Test Auth**: Buat akun dan uji coba login.
8. **Add HTTP Client**: Tambahkan package `dio` untuk API call.
9. **Create Weather Models**: Buat class model (`WeatherModel`, `CurrentWeather`, `HourlyCast`).
10. **API Integration**: Hubungkan ke endpoint Open-Meteo (Lat: -7.87, Long: 112.52).
11. **Display Current Weather**: Tampilkan data dari `current_weather`.
12. **Display Hourly Forecast**: Map data `hourly` (suhu & waktu) ke UI.
13. **State Management**: Gunakan `setState` untuk memperbarui tampilan data.