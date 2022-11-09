import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';

import '/models/shortcuts.dart';
import '/lib.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Duration mainUpdateTime = const Duration(milliseconds: 50);

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      mainUpdateTime,
      (timer) => setState(
        () {
          // If X is greater than background image width
          if ((dx + 50) >= Get.width) {
            dx = 0;
          } else {
            dx += sx;
          }
          // Or if is smaller
          if (dx < 0) {
            dx = sx = 0;
          }

          // If Y is greater than background image height
          if ((dy + 50) >= 50) {
            dy = 0;
          } else {
            dy += sy;
          }
          // Or if is smaller
          if (dy < 0) {
            dy = sy = 0;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): GoIntent('left'),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): GoIntent('up'),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): GoIntent('right'),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): GoIntent('down'),
        LogicalKeySet(LogicalKeyboardKey.keyZ): FunIntent('b'),
        LogicalKeySet(LogicalKeyboardKey.keyX): GoIntent('a'),
      },
      child: Actions(
        actions: {
          GoLeftIntent: GoLeftAction(),
          GoUpIntent: GoUpAction(),
          GoRightIntent: GoRightAction(),
          GoDownIntent: GoDownAction(),
          AIntent: AAction(),
          BIntent: BAction(),
        },
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset('assets/img/margolvls.jpeg'),
              Positioned(
                left: dx,
                top: dy,
                child: Image.asset(
                  'assets/anim/maria_go.gif',
                  width: 50,
                ),
              ),
            ],
          ),
          floatingActionButton: GetPlatform.isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Joystick(
                        onStickDragEnd: () {
                          sx = sy = 0;
                        },
                        listener: (details) {
                          setState(
                            () {
                              sx = details.x * 20;
                              sy = details.y * 20;
                            },
                          );
                        },
                        mode: JoystickMode.horizontalAndVertical,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: Actions.handler(
                                  context,
                                  const BIntent(),
                                ) ??
                                () {},
                            child: const RetroText('B'),
                          ),
                          const SizedBox(width: 20),
                          FloatingActionButton(
                            onPressed: Actions.handler(
                                  context,
                                  const AIntent(),
                                ) ??
                                () {},
                            child: const RetroText('A'),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
