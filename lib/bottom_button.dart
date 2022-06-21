import 'package:flutter/material.dart';
import 'package:bmi_calculator_project/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  final TextStyle? style;

  BottomButton({required this.buttonText, required this.onTap, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kBottomContainerHeight,
      decoration: const BoxDecoration(
        color: kBottomContainerColor,
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          buttonText.toUpperCase(),
          style: style,
        ),
      ),
    );
  }
}
