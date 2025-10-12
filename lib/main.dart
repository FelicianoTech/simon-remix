import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'pages/game.dart';
import 'pages/settings.dart';
import 'pages/about.dart';
import 'values.dart' as global;
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  global.prefs = await SharedPreferences.getInstance();

  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    themeProvider.setThemeMode(global.prefs.getInt('themeMode') ?? 0);

    return MaterialApp(
      title: 'Simon Remix',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/game': (BuildContext context) => GamePage(key: global.gameKey),
        '/settings': (BuildContext context) => SettingsPage(),
        '/about': (BuildContext context) => AboutPage(),
      },
    );
  }
}
