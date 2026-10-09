import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50),

              // Nama kota
              Text(
                'Malang',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),

              SizedBox(height: 80),

              // Suhu utama
              Text(
                '25°',
                style: TextStyle(
                  fontSize: 100,
                ),
              ),

              SizedBox(height: 100),

              // Perkiraan cuaca
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Minggu',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      Icon(
                        Icons.sunny,
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '20°C',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Text(
                        'Senin',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      Icon(
                        Icons.cloudy_snowing,
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '23°C',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Text(
                        'Selasa',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      Icon(
                        Icons.cloud,
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '22°C',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}