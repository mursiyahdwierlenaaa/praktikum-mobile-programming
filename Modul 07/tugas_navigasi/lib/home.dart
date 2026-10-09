import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D8BFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Ini Halaman Home",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Banyak aplikasi memiliki beberapa layar untuk menampilkan "
                    "informasi yang berbeda. Contohnya, ada layar produk, dan "
                    "ketika pengguna mengklik produk, akan muncul layar dengan "
                    "detail produk tersebut.",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.house_rounded,
                      size: 80,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              const Text(
                "Pertama, kita perlu membuat dua halaman atau \"routes\" yang "
                    "ingin kita tampilkan. Selanjutnya, kita gunakan perintah "
                    "Navigator.push() untuk berpindah dari halaman pertama ke "
                    "halaman kedua. Ini seperti kita membuka halaman baru. "
                    "Terakhir, kita bisa kembali dari halaman kedua ke halaman "
                    "pertama menggunakan Navigator.pop(). Seperti menutup "
                    "halaman kedua dan kembali ke halaman pertama.",
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Berpindah ke Halaman Tujuan menggunakan Named Route
                    Navigator.pushNamed(context, '/tujuan');
                  },
                  child: const Text("Ke halaman tujuan >"),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}