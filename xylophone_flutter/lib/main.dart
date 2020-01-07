import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  //Play sounds from assets
  void playSound(String value) {
    final player = AudioCache();
    player.play(value);
  }

  Expanded musicButtons(int soundNumber, Color colour) {
    return Expanded(
      child: FlatButton(
        color: colour,
        onPressed: () {
          playSound('note$soundNumber.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                musicButtons(1, Colors.pink),
                musicButtons(2, Colors.blue),
                musicButtons(3, Colors.red),
                musicButtons(4, Colors.green),
                musicButtons(5, Colors.yellow),
                musicButtons(6, Colors.orange),
                musicButtons(7, Colors.indigo),
              ],
            ),
          )),
    );
  }
}
