import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ChooseGender extends StatelessWidget {
  final String genderText;
  final IconData genderIcon;

  ChooseGender(this.genderText, this.genderIcon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(height: 10),
        Text(
          genderText,
          style: labelTextStyle,
        )
      ],
    );
  }
}
