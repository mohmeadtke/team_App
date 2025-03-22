import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int pageNum;
  const AppBarWidget({super.key, required this.pageNum})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 22, 20, 20),
      titleSpacing: 0, // Removes default spacing
      title: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      "Team App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    Transform(
                      transform: Matrix4.identity()
                        ..scale(-1.0, 1.0), // Flip horizontally
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
