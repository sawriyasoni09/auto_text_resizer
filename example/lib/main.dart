import 'package:flutter/material.dart';
import 'package:auto_text_resizer/auto_text_resizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Auto Text Resizer Demo")),
        body: Center(
          child: SizedBox(
            width: 150, // try different widths
            child: AutoText(
              "This is a very long text that should shrink!",
              style: const TextStyle(color: Colors.black),
              minFontSize: 10,
              maxFontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
