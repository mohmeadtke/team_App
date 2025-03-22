import 'package:flutter/material.dart';

class CardWidet extends StatelessWidget {
  const CardWidet({super.key, required this.buttonText});

  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          // const SizedBox(
          //   width: 20,
          // ),
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(122, 255, 255, 255)),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   width: 100,
                  // ),
                  // const Spacer(),
                  Container(
                    height: 55,
                    width: 200,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(61, 0, 0, 0),
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                      child: Text(
                        buttonText,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 20,
                  // )
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   width: 20,
          // ),
        ],
      ),
    );
  }
}
