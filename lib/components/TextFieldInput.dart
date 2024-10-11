import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  TextFieldInput({super.key, required this.hintText, required this.onChanged,this.ispass});
  Function(String) onChanged;
  String hintText;
  bool? ispass;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: ispass!,
      validator: (value) {
        if (value!.isEmpty) {
          return "the value is empty";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 17, color: Color(0xff595F6B)),
        labelStyle: const TextStyle(color: Colors.black),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xffE1E1F1), width: 1.3),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
