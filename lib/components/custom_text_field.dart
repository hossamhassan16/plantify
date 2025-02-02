import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? InputType;
  final Widget? prefixIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final String text;
  final String hintText;
  final bool obsecureText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const CustomTextField(
      {super.key,
      this.InputType,
      required this.prefixIcon,
      this.onSaved,
      this.onChanged,
      required this.text,
      required this.hintText,
      this.obsecureText = false,
      required this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: TextFormField(
        obscureText: obsecureText,
        keyboardType: InputType,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            // borderSide: BorderSide.none
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          prefixIcon: prefixIcon,
          label: Text(text),
          hintText: hintText,
        ),
      ),
    );
  }
}
