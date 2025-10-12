import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../values.dart' as global;
import '../theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    int themeInt = global.prefs.getInt('themeMode') ?? 0;

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
              RadioGroup<int>(
                groupValue: themeInt,
                onChanged: (int? value) {
                  int themeMode = 0;
                  setState(() {
                    themeInt = value ?? 0;
                    themeProvider.setThemeMode(themeInt);
                    global.prefs.setInt('themeMode', themeInt);
                  });
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Theme mode:"),
                    RadioListTile<int>(
                      title: Text("system"),
                      value: 0,
                    ),
                    RadioListTile<int>(
                      title: Text("light"),
                      value: 1,
                    ),
                    RadioListTile<int>(
                      title: Text("dark"),
                      value: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ), // Center
      ), // Padding
    );
  }
}
