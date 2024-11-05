import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/data.dart';
import 'screens/contact.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationScreen(),
    );
  }
}

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key})


}
