import 'package:flutter/material.dart';
import 'package:teamapp/Features/auth/Presentation/Widget/bloc_form.dart';
import '../Widget/back_grond.dart';
import '../Widget/toptext.dart';
import '../Widget/undre_line_text.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFF7F5AF0);
    const cardGradient = LinearGradient(
      colors: [Color(0xFF23243A), Color(0xFF181A20)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background gradient
            Container(
              decoration: const BoxDecoration(
                gradient: cardGradient,
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(
                    color: accentColor.withOpacity(0.18),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person_add_alt_1, color: accentColor, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      "Create Account",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Sign up to get started",
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const BlocForm(buttonText: 'log-in', x: 1),
                    const SizedBox(height: 16),
                    Undrelinetext(
                      text: "Back to sign in",
                      fun: () {
                        Navigator.pushNamed(context, '/SignIn');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
