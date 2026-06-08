import 'package:flutter/material.dart';
import 'navigation/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receitas App',
      theme: ThemeData(
      colorSchemeSeed: Colors.orange,
      useMaterial3: true,
    ),
      home: const BottomNav(),
    );
  }
}