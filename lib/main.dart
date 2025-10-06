import 'package:bmi_calculator/features/bmi/presentation/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BmiCalculatorScreen());
  }
}
