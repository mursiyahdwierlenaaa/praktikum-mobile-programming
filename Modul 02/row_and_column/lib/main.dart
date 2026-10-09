import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row and Column'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakBiruJempol(
                    warna: Colors.blue, teks: 'Biru',),
                  SizedBox(width: 20),
                  KotakBiruJempol(
                    warna: Colors.green, teks: 'Hijau',),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakBiruJempol(
                    warna: Colors.orange, teks: 'Oranye',),
                  SizedBox(width: 20),
                  KotakBiruJempol(
                    warna: Colors.purple, teks: 'Ungu',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KotakBiruJempol extends StatelessWidget {
  final Color warna;
  final String teks;

  KotakBiruJempol({
    required this.warna,
    required this.teks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 140,
      decoration: BoxDecoration(
        color: warna,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
          SizedBox(height: 10),
          Text(
            teks,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}