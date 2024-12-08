import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/game.dart';
import 'values.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simon Remix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/game': (BuildContext context) => GamePage(key: gameKey),
      },
    );
  }
}
