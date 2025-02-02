import 'package:flutter/material.dart';
import 'package:plantifi/onboard/onboard_item.dart';

class OnboardScreen extends StatelessWidget {
  static const String routeName = 'onboard_screen';

  const OnboardScreen({super.key, required this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          OnboardItem(
              image: "assets/images/m2.png",
              description1: "Enjoy your",
              description2: " Life with Plants"),
          OnboardItem(
              image: "assets/images/onboard2.png",
              description1: "Greener with",
              description2: "Every Tap.."),
          OnboardItem(
              image: "assets/images/on1.png",
              description1: "Leaf by Leaf",
              description2: "Grow Smart."),
        ],
      ),
    );
  }
}
