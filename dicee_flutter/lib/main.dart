import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDie = 1;
  int rightDie = 1;

  void die() {
    rightDie = Random().nextInt(6) + 1;
    leftDie = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Image.asset('images/dice$leftDie.png'),
                onPressed: () {
                  setState(() {
                    die();
//                    leftDie = Random().nextInt(7);
//                    print("die is $leftDie");
//                    while (leftDie == 0) {
//                      print("while $leftDie");
//                      leftDie = Random().nextInt(7);
//                      if (leftDie != 0) break;
//                    }
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$rightDie.png'),
              onPressed: () {
                setState(() {
//                  rightDie = Random().nextInt(6) + 1;
                  die();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
