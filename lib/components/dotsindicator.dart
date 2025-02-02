import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Dotsindicator extends StatelessWidget {
  const Dotsindicator({super.key, required this.dotIndex});
  final double? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey.shade400))),
      dotsCount: 3,
      position: (dotIndex ?? 0.0).toInt(),
    );
  }
}
