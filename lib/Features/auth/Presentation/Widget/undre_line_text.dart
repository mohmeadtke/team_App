import 'package:flutter/material.dart';

class Undrelinetext extends StatelessWidget {
  const Undrelinetext({super.key, required this.text, required this.fun});
  final String text;
  final GestureTapCallback fun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: fun,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF6877FF), // Set the color
              fontSize: 16,
              decoration: TextDecoration.underline, // Add underline here
              decorationColor:
                  Colors.blue, // Optional: Customize the underline color
              decorationThickness:
                  2, // Optional: Set the thickness of the underline
            ),
          ),
        ),
      ),
    );
  }
}
