import 'package:flutter/material.dart';

class TextFiled extends StatelessWidget {
  const TextFiled(
      {super.key,
      required this.controller,
      required this.validator,
      required this.labilText});
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String labilText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          // labelText: labilText,
          hintText: labilText,
          labelStyle: const TextStyle(
            color: Color.fromARGB(131, 0, 0, 0),
          ),
          filled: true,
          fillColor: Colors.white, // Set background to white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: validator,
        textAlign: TextAlign.center,
      ),
    );
  }
}
