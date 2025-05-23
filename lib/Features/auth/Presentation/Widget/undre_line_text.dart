import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Undrelinetext extends StatelessWidget {
  const Undrelinetext({super.key, required this.text, required this.fun});
  final String text;
  final GestureTapCallback fun;

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFF7F5AF0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: fun,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: accentColor,
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationColor: accentColor,
              decorationThickness: 2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
