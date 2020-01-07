import 'package:bmi_calculator/businessLogic/Calculator.dart';
import 'package:bmi_calculator/components/circle_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/calculate_bmi_button.dart';
import '../components/choose_gender.dart';
import '../components/reuseable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  ///User body height
  int bodyHeight = 180;
  int bodyWeight = 60;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              /// Male button
              Expanded(
                child: ReusableCard(
                    backgroundColour: selectedGender == Gender.male
                        ? activeCardColour
                        : cardMainColour,
                    insideCard: ChooseGender('Male', FontAwesomeIcons.mars),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    }),
              ),

              /// Female button
              Expanded(
                child: ReusableCard(
                  backgroundColour: selectedGender == Gender.female
                      ? activeCardColour
                      : cardMainColour,
                  insideCard: ChooseGender('Female', FontAwesomeIcons.venus),
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              )
            ],
          )),

          /// Height button
          Expanded(
            child: ReusableCard(
                backgroundColour: cardMainColour,
                insideCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          bodyHeight.toString(),
                          style: labelAdjustNumber,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      /// Takes normal values of current widget and adds optionals.
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pink,
                        overlayColor: Color(0x29E91E63),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: bodyHeight.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: Colors.black12,
                        onChanged: (double newValue) {
                          setState(() {
                            bodyHeight = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),

          Expanded(
              child: Row(
            children: <Widget>[
              /// Weight button
              Expanded(
                child: ReusableCard(
                    backgroundColour: cardMainColour,
                    insideCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                bodyWeight.toString(),
                                style: labelAdjustNumber,
                              ),
                              Text(
                                'kg',
                                style: labelTextStyle,
                              )
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (bodyWeight > 20) bodyWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (bodyWeight < 150) bodyWeight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    )),
              ),

              /// Age button
              Expanded(
                child: ReusableCard(
                    backgroundColour: cardMainColour,
                    insideCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: labelAdjustNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age < 130) age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    )),
              )
            ],
          )),

          /// Calculate button
          CalculateBMIButton(
            buttonTitle: 'CALCULATE',
            onPressed: () {
              Calculator cal =
                  Calculator(weight: bodyWeight, height: bodyHeight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: cal.calculateBMI(),
                            resultText: cal.getResult(),
                            interpretation: cal.getInterpretation(),
                          )));
            },
          )
        ],
      ),
      floatingActionButton: Theme(
        data: ThemeData(accentColor: Colors.grey),
        child: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
