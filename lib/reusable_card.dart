import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  // Text Widget as default value. We must indicate one. :(
  ReusableCard({required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}