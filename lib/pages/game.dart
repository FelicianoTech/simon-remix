import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import '../values.dart';
import '../components/simon.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  GameState state = GameState.NotStarted;
  Duration speed = const Duration(milliseconds: 1000);
  var choices = List<SimonColor>.empty(growable: true);
  int choiceIndex = -1;
  Simon simon = Simon(gameKey: gameKey);
  int level = 0;

  void advanceLevel() {
    level++;
    randomSimonButton(1);
    present();
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Game Over"),
          content: Text("You've made it to level $level."),
          actions: <Widget>[
            TextButton(
              child: const Text("Play again"),
              onPressed: () {
                resetGame();
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("Main menu"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        );
      },
    );
  }

  void endGame() {
    setState(() {
      state = GameState.Ended;
    });

    _dialogBuilder(context);
  }

  void present() {
    state = GameState.Presenting;
    choiceIndex = 0;

    Timer.periodic(
      speed,
      (timer) {
        // if we've gone through all the choices, quit
        if (choiceIndex >= choices.length) {
          choiceIndex = -1;
          setState(() {
            state = GameState.Waiting;
          });
          timer.cancel();
        } else {
          setState(() {
            simon.lightButton(choices[choiceIndex]);
          });

          choiceIndex++;
        }
      },
    );

    print("The choosen colors are:");
    for (SimonColor c in choices) {
      print(c.name);
    }
  }

  void randomSimonButton(int num) {
    for (var i = 0; i < num; i++) {
      Random rand = Random();
      choices.add(SimonColor.values[rand.nextInt(SimonColor.values.length)]);
    }
  }

  void resetGame() {
    setState(() {
      level = 0;
      choices = List<SimonColor>.empty(growable: true);
      choiceIndex = -1;
      state = GameState.NotStarted;
    });
  }

  void startGame() {
    level = 1;
    randomSimonButton(4);
    present();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classic Mode'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              (level > 0)
                  ? Text("Level $level", style: TextStyle(fontSize: 30.0))
                  : Text(" ", style: TextStyle(fontSize: 30.0)),
              SizedBox(height: 20.0),
              simon,
              SizedBox(height: 20.0),
              if (state == GameState.NotStarted)
                ElevatedButton(
                  child: const Text("Start"),
                  onPressed: () {
                    startGame();
                  },
                ),
              if (state == GameState.Presenting)
                Text("Simon's turn", style: TextStyle(fontSize: 30.0)),
              if (state == GameState.Waiting)
                Text("Your turn", style: TextStyle(fontSize: 30.0)),
            ],
          ), // Column
        ), // Center
      ), // Padding
    );
  }

  void verifyBid(SimonColor simonColor) {
    choiceIndex++;

    if (simonColor != choices[choiceIndex]) {
      endGame();
      return;
    }

    if (choiceIndex == (choices.length - 1)) {
      advanceLevel();
      return;
    }
  }
}
