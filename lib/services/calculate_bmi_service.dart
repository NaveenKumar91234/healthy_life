import 'dart:math';

class CalculateBMI {
  final double height;
  final int weight;
  CalculateBMI(this.height, this.weight);
  double _bmi = 0;
  String calculate() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    String result = 'Normal';
    if (_bmi < 18.5) result = 'Under Weight';
    if (_bmi > 18.5 && _bmi <= 29.9) result = 'Normal';
    if (_bmi >= 30 && _bmi <= 40) result = 'Over Weight';

    return result;
  }

  String getNarration() {
    String result = '';
    if (_bmi < 18.5) {
      result = '(please take our suggestions)';
    }
    if (_bmi > 18.5 && _bmi <= 29.9) {
      result = "(Your are Normal)";
    }
    if (_bmi >= 30 && _bmi <= 40) {
      result = '(please take our suggestions)';
    }
    return result;
  }
}
