
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(const MyApp());
}

// Langkah f: Membuat MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lokasi Saya',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const LocationScreen(),
    );
  }
}

// Langkah g: Membuat LocationScreen
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? _kecamatan;
  String? _kota;
  bool _isLoading = false;
  String? _errorMessage;

  // Langkah h: Fungsi untuk mengambil lokasi
  Future<void> _getLocation() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _kecamatan = null;
      _kota = null;
    });

    try {
      // Memeriksa apakah layanan GPS aktif
      bool serviceEnabled =
      await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        throw Exception('Layanan lokasi/GPS tidak aktif.');
      }

      // Memeriksa izin lokasi
      LocationPermission permission =
      await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          throw Exception('Izin lokasi ditolak.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
          'Izin lokasi ditolak secara permanen.',
        );
      }

      // Mengambil koordinat lokasi saat ini
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // Mengubah koordinat menjadi informasi alamat
      List<Placemark> placemarks =
      await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        // Menampilkan hasil geocoding di terminal
        debugPrint('===== HASIL PEMERIKSAAN LOKASI =====');
        debugPrint('Latitude: ${position.latitude}');
        debugPrint('Longitude: ${position.longitude}');
        debugPrint('SubLocality: ${place.subLocality}');
        debugPrint('Locality: ${place.locality}');
        debugPrint(
          'SubAdministrativeArea: ${place.subAdministrativeArea}',
        );
        debugPrint(
          'AdministrativeArea: ${place.administrativeArea}',
        );
        debugPrint('Name: ${place.name}');
        debugPrint('====================================');

        setState(() {
          // Mengambil nama wilayah dari data geocoding
          _kecamatan = place.subLocality;
          _kota = place.subAdministrativeArea;
        });
      } else {
        throw Exception('Informasi alamat tidak ditemukan.');
      }
    } catch (e) {
      setState(() {
        _errorMessage =
            e.toString().replaceAll('Exception: ', '');
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Langkah i: Membuat tampilan aplikasi
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi Saya'),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (_isLoading)
                      const CircularProgressIndicator()
                    else if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      )
                    else if (_kecamatan == null)
                        const Text(
                          'Tekan tombol untuk menampilkan lokasi.',
                          textAlign: TextAlign.center,
                        )
                      else ...[
                          Text(
                            'Kelurahan/Kecamatan: $_kecamatan',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Kota: $_kota',
                            textAlign: TextAlign.center,
                          ),
                        ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isLoading ? null : _getLocation,
              child: const Text(
                'TAMPILKAN LOKASI SAAT INI',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
