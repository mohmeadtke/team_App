import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class noTeam extends StatelessWidget {
  const noTeam({
    super.key,
    required this.accentColor,
    required this.onButtonPressed,
  });

  final Color accentColor;

  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        color: const Color.fromARGB(0, 255, 255, 255),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.group_outlined, color: accentColor, size: 64),
              const SizedBox(height: 24),
              Text(
                "You don't have a team yet!",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Start collaborating by creating a new team\nor join an existing one from the sidebar.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Icon(Icons.arrow_back, color: accentColor, size: 32),
              Text(
                "Open the sidebar to get started!",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: accentColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
