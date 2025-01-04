import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/game.dart';

enum GameState {
  NotStarted,
  Presenting,
  Waiting,
  Ended,
}

enum SimonColor implements Comparable<SimonColor> {
  Red,
  Green,
  Blue,
  Yellow;

  @override
  int compareTo(SimonColor other) => index - other.index;
}

GlobalKey<GamePageState> gameKey = GlobalKey<GamePageState>();

late SharedPreferences prefs;
String version = "dev";
