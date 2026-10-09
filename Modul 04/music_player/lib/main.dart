import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemutar Musik',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pemutar Musik'),
        ),

        body: Center(
          child: Text(
            'Pemutar Musik',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),

        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          color: Colors.black54,
          child: Row(
            children: [

              // Tombol Shuffle
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.white,
                  ),
                ),
              ),

              // Tombol Previous
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ),
                ),
              ),

              // Tombol Play
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                  ),
                  iconSize: 50,
                ),
              ),

              // Tombol Next
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                ),
              ),

              // Tombol Repeat
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.repeat,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}