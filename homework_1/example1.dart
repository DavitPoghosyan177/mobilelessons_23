import 'dart:io';

void main() {
  print('Enter your name: ');
  String? userName = stdin.readLineSync();

  //print('Enter your weight (kg): ');
  //double userWeight =45;
//
  //print('Enter your height (m): ');
  //double userHeight = 45;
//j
  //double bmi = calculateBMI(userWeight, userHeight);
//
  //print('Hello $userName. Your BMI is ${bmi.toStringAsFixed(2)}.');
}

double calculateBMI(double weight, double height) {
  return weight / (height * height);
}
