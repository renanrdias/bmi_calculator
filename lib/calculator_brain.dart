import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi = 0;

  CalculatorBrain({required this.height,
    required this.weight});

  String calculateBMI() {
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getTitleResult() {
    if(_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi >= 18.5 && _bmi <=24.9) {
      return 'Normal';
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return 'Overweight';
    } else if (_bmi >= 30 && _bmi <=40) {
      return 'Obesity';
    } else{
      return 'Severe Obesity';
    }
  }

  String getResultDescription() {
    if(_bmi < 18.5) {
      return 'You should eat more, little chicken!';
    } else if (_bmi >= 18.5 && _bmi <=24.9) {
      return 'Nothing but the average...';
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return 'You\'re getting overweight!';
    } else if (_bmi >= 30 && _bmi <=40) {
      return 'You\'re already obese. Try to exercise more!';
    } else{
      return 'Now you must call a doctor. You\'re so obese that you\'re about to die!';
    }
  }

}