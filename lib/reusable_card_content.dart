import 'package:flutter/material.dart';
import 'package:bmi_calculator_project/constants.dart';

class ReusableCardContent extends StatelessWidget {
  final IconData iconContent;
  final String textContent;

  ReusableCardContent({required this.iconContent, required this.textContent});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconContent,
          size: 60.0,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          textContent,
          style: kTextStyleCard,
        ),
      ],
    );
  }
}
