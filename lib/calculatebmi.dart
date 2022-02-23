import 'dart:math';
class Calculatebmi {
  int height;
  int weight;
  double _bmi;

  Calculatebmi({this.weight, this.height});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }


  String getresult() {
    if (_bmi >= 25) {
      return ('Overweight');
    } else if (_bmi > 18.5) {
      return ('Normal');
    } else {
      return ('underweight');
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return('You have higher than normal body weight. Try to exercise more.');
    } else if (_bmi > 18.5) {
      return ('You have a normal body weight, Good Job!');
    } else {
      return ('You have lower than normal body weight.You can eat a bit more');
    }
  }
}