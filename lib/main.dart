import 'package:book_app/view/pages/home_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});
  // final String headerTitle = "Books";

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

