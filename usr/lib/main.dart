import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/generate_video_screen.dart';
import 'screens/templates_screen.dart';
import 'screens/history_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const SoraVideoApp());
}

class SoraVideoApp extends StatelessWidget {
  const SoraVideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sora2 Pro AI Video Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/generate': (context) => const GenerateVideoScreen(),
        '/templates': (context) => const TemplatesScreen(),
        '/history': (context) => const HistoryScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}