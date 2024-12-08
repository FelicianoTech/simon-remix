import 'dart:math';
import 'package:flutter/material.dart';
import 'simon_button.dart';
import '../values.dart';
import '../pages/game.dart';

class Simon extends StatelessWidget {
  final keys = <SimonColor, GlobalKey<SimonButtonState>>{
    SimonColor.Red: GlobalKey<SimonButtonState>(),
    SimonColor.Green: GlobalKey<SimonButtonState>(),
    SimonColor.Blue: GlobalKey<SimonButtonState>(),
    SimonColor.Yellow: GlobalKey<SimonButtonState>(),
  };
  GlobalKey<GamePageState> gameKey;

  Simon({
    super.key,
    required this.gameKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox.square(
          dimension: 364.0,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.black,
              shape: CircleBorder(),
            ),
          ),
        ),
        Positioned(
          top: 72.0,
          right: 18.0,
          bottom: 72.0,
          child: RotatedBox(
            quarterTurns: 1,
            child: SimonButton(
              key: keys[SimonColor.Red],
              simonColor: SimonColor.Red,
              gameKey: gameKey,
            ),
          ),
        ),
        Positioned(
          top: 18.0,
          right: 72.0,
          left: 72.0,
          child: SimonButton(
            key: keys[SimonColor.Green],
            simonColor: SimonColor.Green,
            gameKey: gameKey,
          ),
        ),
        Positioned(
          top: 72.0,
          bottom: 72.0,
          left: 18.0,
          child: RotatedBox(
            quarterTurns: 3,
            child: SimonButton(
              key: keys[SimonColor.Blue],
              simonColor: SimonColor.Blue,
              gameKey: gameKey,
            ),
          ),
        ),
        Positioned(
          right: 72.0,
          bottom: 18.0,
          left: 72.0,
          child: RotatedBox(
            quarterTurns: 2,
            child: SimonButton(
              key: keys[SimonColor.Yellow],
              simonColor: SimonColor.Yellow,
              gameKey: gameKey,
            ),
          ),
        ),
      ],
    );
  }

  void lightButton(SimonColor simonColor) {
    keys[simonColor]!.currentState!.press();
  }
}
