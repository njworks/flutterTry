import 'package:bmi_calculator/components/calculate_bmi_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({this.bmiResult, this.resultText, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            child: Center(
              child: Text(
                'Your Result:',
                style: titleTextStyle,
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                backgroundColour: activeCardColour,
                insideCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: resultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: resultsBMIStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: resultBMIBodyStyle,
                    )
                  ],
                ),
              )),
          CalculateBMIButton(
              buttonTitle: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
