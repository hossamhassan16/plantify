import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Sign extends StatelessWidget {
  Sign({super.key, required this.onTap, required this.text});
  VoidCallback? onTap;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 250,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          text!,
          style: const TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
