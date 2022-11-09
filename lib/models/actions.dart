import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_motions/models/getx.dart';

import '/lib.dart';
import 'intents.dart';

class GoLeftAction extends Action<GoLeftIntent> {
  @override
  Object? invoke(GoLeftIntent intent) {
    dx -= 20;
    print('helo');

    return null;
  }
}

class GoUpAction extends Action<GoUpIntent> {
  @override
  Object? invoke(GoUpIntent intent) {
    dy += 10;
    print('helo');

    return null;
  }
}

class GoRightAction extends Action<GoRightIntent> {
  @override
  Object? invoke(GoRightIntent intent) {
    dx += 20;
    print('helo');

    return null;
  }
}

class GoDownAction extends Action<GoDownIntent> {
  @override
  Object? invoke(GoDownIntent intent) {
    dy -= 5;
    print('helo');

    return null;
  }
}

class AAction extends Action<AIntent> {
  @override
  Object? invoke(AIntent intent) {
    // dy += 35;
    // Timer(
    //   const Duration(milliseconds: 200),
    //   () => setGet(
    //     () => dy -= 35,
    //   ),
    // );
    sx = 20;
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
