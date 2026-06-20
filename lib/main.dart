import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

/// App ka starting point
void main() {
  runApp(const MyApp());
}

/// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Debug banner hide
      debugShowCheckedModeBanner: false,

      title: 'Flutter Login',

      // First screen
      home: const LoginScreen(),
    );
  }
}