import 'package:flutter/material.dart';

class TujuanPage extends StatelessWidget {
  const TujuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF4D2E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Ini Halaman Tujuan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Untuk berpindah ke halaman baru, gunakan metode "
                    "Navigator.push(). Metode push() akan menambahkan Route ke "
                    "dalam tumpukan Route yang dikelola oleh Navigator. Route "
                    "ini dapat dibuat secara kustom atau menggunakan "
                    "MaterialPageRoute, yang memiliki animasi transisi sesuai "
                    "dengan platform yang digunakan.",
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
                      Icons.beach_access_rounded,
                      size: 80,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              const Text(
                "Untuk menutup halaman kedua dan kembali ke halaman "
                    "pertama, gunakan metode Navigator.pop(). Metode pop() "
                    "akan menghapus Route saat ini dari tumpukan Route yang "
                    "dikelola oleh Navigator.",
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Kembali ke Halaman Utama
                    Navigator.pop(context);
                  },
                  child: const Text("< Kembali ke home"),
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