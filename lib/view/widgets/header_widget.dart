import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget(
      {super.key,
      required this.headerTitle,
      this.isHomePage = false,
      });

  final String headerTitle;
  final bool isHomePage;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(headerTitle),
      leading: isHomePage
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                  Navigator.of(context).pop();
              },
            ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(100, 2, 0, 36),
          Color.fromARGB(100, 9, 9, 121),
          Color.fromARGB(100, 0, 212, 255)
        ], begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight)),
      ),
    );
  }
}
