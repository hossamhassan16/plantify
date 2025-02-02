import 'package:flutter/material.dart';
import 'package:plantifi/onboard/onboard_screen.dart';
import 'package:plantifi/onboard/onboarding_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardScreen.routeName,
      routes: {
        OnboardScreen.routeName: (context) => const OnboardingBody(),
      },
    );
  }
}
