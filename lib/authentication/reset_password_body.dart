import 'package:flutter/material.dart';
import 'package:plantifi/authentication/login_view.dart';
import 'package:plantifi/components/custom_text_field.dart';
import 'package:plantifi/components/signup_login.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  _ResetPasswordBodyState createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final _formKey = GlobalKey<FormState>(); // Form Key for validation
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      // Proceed with password reset logic
      print("Password Reset Successful");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginView();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey, // Assign form key
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image.asset("assets/images/reset-removebg-preview.png"),
              borderRadius: BorderRadius.circular(20),
            ),
            Text(
              "Reset password",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.green[800],
              ),
            ),
            CustomTextField(
              prefixIcon: Icon(Icons.lock),
              text: "Password",
              hintText: "Password must contain characters",
              obsecureText: true,
              controller: passwordController, // Assign controller
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                } else if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),
            CustomTextField(
              prefixIcon: Icon(Icons.lock),
              text: "Confirm password",
              hintText: "Re-enter your password",
              obsecureText: true,
              controller: confirmPasswordController, // Assign controller
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please confirm your password";
                } else if (value != passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Sign(
                onTap: _resetPassword, // Call validation before resetting
                text: "Reset",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
