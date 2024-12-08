import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game.dart';
import '../values.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/img/logo--1000x284.png')),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child: const Text("Play"),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: const Text("Quit"),
              ),
            ],
          ),
        ), // Center
      ), // Padding
    );
  }
}
