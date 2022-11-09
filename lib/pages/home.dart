import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';

import '/models/getx.dart';
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
          if (dx <= 0) {
            print('in if <0');
            dx = 0;
            sx = -sx;
            print('sx is $sx');
          }

          // If Y is greater than background image height
          if ((dy + 50) >= 20) {
            dy = 0;
          } else {
            dy += sy;
          }
          // Or if is smaller
          if (dy <= 0) {
            dy = 0;
            sy = -sy;
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
        LogicalKeySet(LogicalKeyboardKey.keyX): FunIntent('a'),
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
          body: SizedBox.expand(
            child: Stack(
              children: [
                Image.asset(
                  'assets/img/margolvls.jpeg',
                  fit: BoxFit.cover,
                ),
                Obx(
                  () {
                    c.u.value;
                    return Positioned(
                      left: dx,
                      top: dy,
                      child: Image.asset(
                        'assets/anim/maria_go.gif',
                        width: 50,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: GetPlatform.isMobile
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
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
                            onPressed: () => BAction().invoke(
                              const BIntent(),
                            ),
                            child: const RetroText('B'),
                          ),
                          const SizedBox(width: 20),
                          FloatingActionButton(
                            onPressed: () => AAction().invoke(
                              const AIntent(),
                            ),
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
