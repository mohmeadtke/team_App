import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFiled extends StatelessWidget {
  const TextFiled({
    super.key,
    required this.controller,
    required this.validator,
    required this.labilText,
    this.obscureText = false,
  });
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String labilText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFF7F5AF0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: labilText,
          hintStyle: GoogleFonts.poppins(color: Colors.white54),
          filled: true,
          fillColor: Colors.white.withOpacity(0.07),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: accentColor, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: accentColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
          ),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
