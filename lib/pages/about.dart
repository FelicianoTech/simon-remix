import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../values.dart' as global;

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final Uri _url = Uri.parse('https://www.Feliciano.Tech/projects/simon-remix');

  Future<void> _openURL() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Simon Remix'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/img/logo--1000x284.png', width: 110),
              Text("version: " + global.version),
              const SizedBox(height: 40.0),
              const Text(
                  "Simon Remix is a twist on a classic memory game called Simon Says or simply, Simon. It brings the classic brain teaser to your mobile phone to play anywhere anytime. Battle it out against Simon, testing how well you can remember color patterns able to advance to the next, harder round. Get it wrong and ooooo it's game over for you."),
              const SizedBox(height: 30.0),
              const Text(
                  "Simon Remix is an open-source game written with Flutter. Learn more and check out the code with the button below."),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: _openURL,
                child: const Text("Visit Simon Remix webpage"),
              ),
            ],
          ),
        ), // Center
      ), // Padding
    );
  }
}
