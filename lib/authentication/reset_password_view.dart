import 'package:flutter/material.dart';
import 'package:plantifi/authentication/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPasswordBody(),
    );
  }
}
