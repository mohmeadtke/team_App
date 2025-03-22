import 'package:flutter/material.dart';

class Toptext extends StatelessWidget {
  const Toptext({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
