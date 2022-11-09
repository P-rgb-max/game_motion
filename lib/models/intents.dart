import 'package:flutter/material.dart';

class GoIntent extends Intent {
  factory GoIntent(String key) {
    switch (key) {
      case 'left':
        return const GoLeftIntent();
      case 'up':
        return const GoUpIntent();
      case 'right':
        return const GoRightIntent();
      case 'down':
        return const GoDownIntent();
      default:
        return const GoUpIntent();
    }
  }
}

class FunIntent extends Intent {
  factory FunIntent(String key) {
    switch (key) {
      case 'a':
        return const AIntent();
      case 'b':
        return const BIntent();
      default:
        return const AIntent();
    }
  }
}

class GoLeftIntent extends Intent implements GoIntent {
  const GoLeftIntent();
}

class GoUpIntent extends Intent implements GoIntent {
  const GoUpIntent();
}

class GoRightIntent extends Intent implements GoIntent {
  const GoRightIntent();
}

class GoDownIntent extends Intent implements GoIntent {
  const GoDownIntent();
}

class AIntent extends Intent implements FunIntent {
  const AIntent();
}

class BIntent extends Intent implements FunIntent {
  const BIntent();
}
