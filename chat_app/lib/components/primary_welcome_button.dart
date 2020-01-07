import 'package:flutter/material.dart';

class PrimaryWelcomeButton extends StatelessWidget {
  final Color backGroundColour;
  final String text;
  final Function onPressed;

  PrimaryWelcomeButton(
      {this.backGroundColour, this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backGroundColour,
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
