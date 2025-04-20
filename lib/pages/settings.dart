import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../values.dart' as global;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              SwitchListTile(
                title: const Text("Haptic Feedback (vibration)"),
                value: global.prefs.getBool('haptic') ?? true,
                onChanged: (bool value) {
                  setState(() {
                    global.prefs.setBool('haptic', value);
                  });
                },
              ),
            ],
          ),
        ), // Center
      ), // Padding
    );
  }
}
