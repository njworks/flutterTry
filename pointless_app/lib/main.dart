import 'package:flutter/material.dart';

///Main for the app
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: Text('pointlessApp'),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/apple.png'),
          ),
        ),
      ),
    ),
  );
}
