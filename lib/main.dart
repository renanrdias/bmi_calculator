import 'package:bmi_calculator_project/page_result.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_project/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0XFF0A0E21),
        appBarTheme: const AppBarTheme(
          color: Color(0XFF0A0E21),
        ),
      ),
      home: const InputPage(),
    );
  }
}
