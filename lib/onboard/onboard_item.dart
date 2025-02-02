import 'package:flutter/material.dart';

class OnboardItem extends StatelessWidget {
  OnboardItem({
    super.key,
    required this.image,
    required this.description1,
    required this.description2,
  });
  final String? image;
  final String? description1;
  final String? description2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Image.asset(
            image!,
            width: 400,
            height: 400,
          ),
          const Spacer(flex: 1),
          Text(
            description1!,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green[900],
            ),
          ),
          Text(
            description2!,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green[900],
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
