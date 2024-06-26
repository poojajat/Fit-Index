import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height,required this.weight});

  final int height;
  final int weight;
  double _bmi=0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overwight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

String getInterpretation() {
  if (_bmi >= 25) {
    return 'You have a higher than normal body weight.Try to exercise more110';
  } else if (_bmi > 18.5) {
    return 'You have normal body weight.God job! ';
  } else {
    return 'You have a lower than normal body weight.you can eat a bit more';
  }
}
}