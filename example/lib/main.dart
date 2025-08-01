import 'package:auto_text_resizer/auto_text_resizer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Auto Text Resizer Demo",)),
        body: Center(
          child: Container(
            color: Colors.yellow[100],
            width: 250,
            height: 150,
            padding: const EdgeInsets.all(8),
            child: const AutoText(
              "This is a very long title that should shrink to fit.",
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              minFontSize: 8,
              maxFontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
