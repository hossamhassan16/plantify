import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Custombutton extends StatelessWidget {
  Custombutton({super.key, required this.onTap, required this.text});
  VoidCallback? onTap;
  final dynamic text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.all(20),
        shape: const CircleBorder(),
      ),
      child: text,
    );
  }
}
