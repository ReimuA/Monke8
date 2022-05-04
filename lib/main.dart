import 'package:flutter/material.dart';
import 'package:monke8/chip8_display.dart';

void main() {
  runApp(const Monke8());
}

class Monke8 extends StatelessWidget {
  const Monke8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var display = List.generate(32, (j) => List.generate(64, (i) => ((j % 2 == 0) ^ (i % 2 == 0))));

    return Chip8Display(
      display: display,
      color: Colors.blue,
    );
  }
}
