import 'dart:math';

class Calculator {
  final weight;
  final height;
  double _bmi;
  Calculator({this.weight, this.height});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than expected body weight';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight';
    } else {
      return 'You have a lower than expected body weight';
    }
  }
}
