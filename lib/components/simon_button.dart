import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../values.dart';
import '../pages/game.dart';
import '../util.dart' as util;

class SimonButton extends StatefulWidget {
  SimonColor simonColor;
  GlobalKey<GamePageState> gameKey;

  SimonButton({
    super.key,
    required this.simonColor,
    required this.gameKey,
  });

  @override
  State<SimonButton> createState() => SimonButtonState();
}

class SimonButtonState extends State<SimonButton> {
  late Color actualColor;
  bool pressed = false;
  Duration delay = const Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();

    switch (widget.simonColor) {
      case SimonColor.Red:
        actualColor = Colors.red[700]!;
        break;
      case SimonColor.Green:
        actualColor = Colors.green[700]!;
        break;
      case SimonColor.Blue:
        actualColor = Colors.blue[700]!;
        break;
      case SimonColor.Yellow:
        actualColor = Colors.yellow[700]!;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          press();
        },
        child: Image(
          image: AssetImage('assets/img/simon-button.png'),
          color: (pressed) ? util.lighten(actualColor, 30) : actualColor,
        ));
  }

  void press() {
    if (gameKey.currentState?.state == GameState.Waiting) {
      gameKey.currentState?.verifyBid(widget.simonColor);
    }

    setState(() {
      pressed = true;
    });

    Timer(
      delay,
      () {
        setState(() {
          pressed = false;
        });
      },
    );

    print("The button " + widget.simonColor.name + " was pressed");
  }
}
