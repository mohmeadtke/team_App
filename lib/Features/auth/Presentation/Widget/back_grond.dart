import 'package:flutter/material.dart';

class Backgrond extends StatelessWidget {
  const Backgrond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     "assets/images/hands.webp",
          //     fit: BoxFit.cover,
          //   ),
          // ),

          // The background filter with animation
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(150, 23, 5, 159),
              Color.fromARGB(150, 0, 0, 0)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
        ],
      ),
    );
  }
}
