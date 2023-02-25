import 'package:flutter/material.dart';
import 'package:wallpaper/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Walls',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.white),
      ),
      home: Home(),
    );
  }
}

