import 'package:flutter/material.dart';

class RetroText extends StatelessWidget {
  const RetroText(
    this.data, {
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontFamily: 'Retro Gaming',
      ),
    );
  }
}

double sx = 0, sy = 0;
double dx = 0, dy = 20;
