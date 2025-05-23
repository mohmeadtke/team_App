import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int pageNum;
  const AppBarWidget({super.key, required this.pageNum})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true, // This centers the title text
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF23243A), Color(0xFF181A20)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Text(
        "Team App",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
        textAlign: TextAlign.center, // Ensures text is centered
      ),
      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.message, color: Color(0xFF7F5AF0)),
      //     onPressed: () {},
      //   ),
      // ],
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
