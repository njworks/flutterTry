import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child:
                Column(mainAxisSize: MainAxisSize.min, // Use only needed space
                    children: <Widget>[
              Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  padding: EdgeInsets.all(15),
                  color: Colors.white,
                  child: Text('Hello')),
              Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  padding: EdgeInsets.all(15),
                  color: Colors.red,
                  child: Text('Hello', style: GoogleFonts.pacifico())),
              SizedBox(
                height: 20,
                width: 300,
                child: Divider(
                  color: Colors.pink,
                  height: 5,
                  thickness: 3,
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: Colors.green,
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Hello'),
                  )),
            ])),
      ),
    );
  }
}
