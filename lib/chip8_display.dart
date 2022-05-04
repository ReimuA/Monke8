import 'package:flutter/material.dart';

class Chip8Display extends StatelessWidget {
  final Color color;
  final List<List<bool>> display;

  const Chip8Display({Key? key, required this.display, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 64;
    var height = MediaQuery.of(context).size.height / 32;

    var rows = display
        .map((row) => Row(
                children: row.map((cell) {
              return Container(
                width: width,
                height: height,
                color: cell ? Colors.blue : Colors.white,
              );
            }).toList()))
        .toList();
    return Column(children: rows);
  }
}
