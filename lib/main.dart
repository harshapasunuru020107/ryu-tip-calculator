import 'package:flutter/material.dart';
import 'screens/tip_calculator_screen.dart';

void main() {
  runApp(const RyuApp());
}

class RyuApp extends StatelessWidget {
  const RyuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ryu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const TipCalculatorScreen(),
    );
  }
}
