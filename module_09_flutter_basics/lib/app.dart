import 'package:flutter/material.dart';
import 'home.dart';

// Stateless -> Unchangeable
// Stateful -> Changeable/dynamic
class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override // Overrides the build method.
  Widget build(BuildContext context) { // context tells us about the page's position.
    return MaterialApp( // MaterialApp is used once for the whole app.
      title: "Flutter 16",
      home: Home(), // The page that opens when the app starts is set in 'home:'.
    ); // MaterialApp() controls the overall app UI.

  }
}