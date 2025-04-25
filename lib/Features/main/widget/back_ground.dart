import 'dart:async';

import 'package:flutter/material.dart';

class BackGround extends StatefulWidget {
  const BackGround({super.key});

  @override
  State<BackGround> createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  List<List<Color>> gradientColors = [
    [
      const Color(0xFF030303),
      const Color.fromARGB(255, 99, 48, 129),
      const Color(0xFF030303),
    ],
    [
      const Color(0xFF030303),
      const Color.fromARGB(255, 0, 98, 255),
      const Color(0xFF030303),
    ],
    [
      const Color(0xFF030303),
      const Color.fromRGBO(255, 61, 139, 0.5),
      const Color(0xFF030303),
    ],
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % gradientColors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: const GradientRotation(50),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors[currentIndex],
          stops: const [0.0, 0.50, 1.0],
        ),
      ),
    );
  }
}
