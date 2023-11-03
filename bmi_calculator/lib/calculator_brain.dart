import 'dart:math';
// import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int? weight;
  final int? height;
  double? _bmi;

  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'Şişman';
    } else if (_bmi! >= 18.5) {
      return 'Normal';
    } else {
      return 'Zayıf';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'Normalden daha yüksek bir vücut ağırlığınız var. Daha fazla egzersiz yapmaya çalışın!';
    } else if (_bmi! >= 18.5) {
      return 'Normal bir vücut ağırlığınız var. Aferin!';
    } else {
      return 'Normalden daha düşük bir vücut ağırlığınız var. Biraz daha yiyebilirsin!';
    }
  }
}