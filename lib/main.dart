import 'package:behance_clone/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Behance',
      theme: ThemeData(
        primaryColor: const Color(0xFF255AF6),
        colorScheme: const ColorScheme.light(
          secondary: Color(0xFFA8915F),
        ),
      ),
      home: const MainPage(),
    );
  }
}
