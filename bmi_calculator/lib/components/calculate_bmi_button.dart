import 'package:flutter/material.dart';

import '../constants.dart';

class CalculateBMIButton extends StatelessWidget {
  final Function onPressed;
  final String buttonTitle;

  CalculateBMIButton({this.buttonTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.pinkAccent,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 70,
        child: Center(
          child: Text(
            buttonTitle,
            style: labelLargeStyle,
          ),
        ),
      ),
    );
  }
}
