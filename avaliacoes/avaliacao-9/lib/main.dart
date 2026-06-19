import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const RestApiApp());
}

class RestApiApp extends StatelessWidget {
  const RestApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
