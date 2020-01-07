import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color backgroundColour;
  final Widget insideCard;
  final Function onPressed;

  ReusableCard({this.backgroundColour, this.insideCard, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: insideCard,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: backgroundColour,
        ),
      ),
    );
  }
}
