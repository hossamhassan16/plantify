import 'package:flutter/material.dart';
import 'package:plantifi/authentication/reset_password_view.dart';
import 'package:plantifi/authentication/signup_view.dart';
import 'package:plantifi/components/custom_text_field.dart';
import 'package:plantifi/components/signup_login.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>(); // Form Key for validation
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Proceed with login
      print("Login Successful");
    } else {
      print("Please fill in all fields");
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
            Image.asset("assets/images/login-removebg-preview.png"),
            Text(
              "Welcome back",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.green[800],
              ),
            ),
            Text(
              "Login to your account",
              style: TextStyle(
                color: Color(0xffA6A6A6),
                fontSize: 17,
              ),
            ),
            CustomTextField(
              prefixIcon: Icon(Icons.email),
              text: "Email",
              hintText: "Enter your email",
              controller: emailController, // Assign controller
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
            ),
            CustomTextField(
              prefixIcon: Icon(Icons.lock),
              text: "Password",
              hintText: "Enter your password",
              obsecureText: true,
              controller: passwordController, // Assign controller
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ResetPasswordView();
                      }));
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Colors.green[800],
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ],
            ),
            Sign(
              onTap: _login, // Call validation on login button press
              text: "Login",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Color(0xffA6A6A6), fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupView();
                        }));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
