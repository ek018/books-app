import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: const HeaderWidget(
              headerTitle: "Profile",
              isHomePage: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: ClipOval(
                        child: Image.asset(
                      "assets/eko.jpg",
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Eko Prasetiyo",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Flutter Engineer",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )));
  }
}
