import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Toptext extends StatelessWidget {
  const Toptext({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.1,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
