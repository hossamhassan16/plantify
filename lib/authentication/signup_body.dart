import 'package:flutter/material.dart';
import 'package:plantifi/authentication/login_view.dart';
import 'package:plantifi/components/custom_text_field.dart';
import 'package:plantifi/components/signup_login.dart';

class SignupBody extends StatefulWidget {
  SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedGender; // Track selected gender

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    governorateController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateAndSignup() {
    if (_formKey.currentState!.validate()) {
      // If all fields are valid, proceed with signup
      print("Signup Successful");
    } else {
      print("Please fill all fields!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey, // Attach form key
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.rotate(
                  angle: 5,
                  child: Image.asset(
                    "assets/images/signup_image.png",
                    width: 169,
                    height: 169,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            CustomTextField(
              prefixIcon: Icon(Icons.person),
              text: "Full name",
              hintText: "Enter your name",
              controller: nameController,
              validator: (value) =>
                  value!.isEmpty ? "Please enter your name" : null,
            ),
            CustomTextField(
              prefixIcon: Icon(Icons.email),
              text: "Email",
              hintText: "Enter your email",
              controller: emailController,
              validator: (value) =>
                  value!.isEmpty ? "Please enter your email" : null,
            ),
            CustomTextField(
              prefixIcon: Icon(Icons.call),
              text: "Mobile number",
              hintText: "Enter your mobile number",
              controller: phoneController,
              validator: (value) =>
                  value!.isEmpty ? "Please enter your mobile number" : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: DropdownButtonFormField<String>(
                validator: (value) => value == null
                    ? "Please select your gender"
                    : null, // Fixed validation
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  prefixIcon: Icon(Icons.people),
                  labelText: "Gender",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                ),
                items: ["Male", "Female"].map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
            ),
            CustomTextField(
              prefixIcon: Icon(Icons.location_city),
              text: "Governorate",
              hintText: "Enter your governorate",
              controller: governorateController,
              validator: (value) =>
                  value!.isEmpty ? "Please enter your governorate" : null,
            ),
            CustomTextField(
              prefixIcon: Icon(Icons.lock),
              text: "Password",
              hintText: "Enter your password",
              obsecureText: true,
              controller: passwordController,
              validator: (value) =>
                  value!.isEmpty ? "Please enter your password" : null,
            ),
            SizedBox(height: 20),
            Sign(
              onTap: () {
                _validateAndSignup(); // Correct function call
              },
              text: "Sign up",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Color(0xffA6A6A6), fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginView();
                      }));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
