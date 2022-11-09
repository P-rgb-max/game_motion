import 'package:flutter/material.dart';

import '/lib.dart';
import 'intents.dart';

class GoLeftAction extends Action<GoLeftIntent> {
  @override
  Object? invoke(GoLeftIntent intent) {
    sx = -20;
    print('helo');

    return null;
  }
}

class GoUpAction extends Action<GoUpIntent> {
  @override
  Object? invoke(GoUpIntent intent) {
    sy = 10;
    print('helo');

    return null;
  }
}

class GoRightAction extends Action<GoRightIntent> {
  @override
  Object? invoke(GoRightIntent intent) {
    sx = 20;
    print('helo');

    return null;
  }
}

class GoDownAction extends Action<GoDownIntent> {
  @override
  Object? invoke(GoDownIntent intent) {
    sy = 5;
    print('helo');

    return null;
  }
}

class AAction extends Action<AIntent> {
  @override
  Object? invoke(AIntent intent) {
    sx = -20;
    print('helo');

    return null;
  }
}

class BAction extends Action<BIntent> {
  @override
  Object? invoke(BIntent intent) {
    sx = -20;
    print('helo');

    return null;
  }
}
