import 'package:flutter/material.dart';
import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({required this.height,required this.weight});
  final int  height;
  final int weight;
  double _bmi=19;
  String claculateBMI(){
     _bmi=weight/pow(height/100,2);
   return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'Over weight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return 'under weight';
    }
  }
  String getInterpretation(){
    if(_bmi>=25){
      return 'You have higher normal body weight. Try to exercise more';
    }
    else if(_bmi>18.5){
      return 'You have normal body weight, Good job';
    }
    else{
      return ' You have lower body weight then the normal. You can eat more';
    }
  }
}