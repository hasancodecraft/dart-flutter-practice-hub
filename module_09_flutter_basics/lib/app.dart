import 'package:flutter/material.dart';
import 'module_09/class_02_basic_widgets/home.dart';
import 'module_09/class_03_app_structure/app_structure.dart';

// Stateless -> Unchangeable
// Stateful -> Changeable/dynamic
class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override // Overrides the build method.
  Widget build(BuildContext context) { // context tells us about the page's position.
    return MaterialApp(// MaterialApp is used once for the whole app.
      debugShowCheckedModeBanner: false, // remove debug mark 
      title: "Flutter 16",
      home: Class3(), // The page that opens when the app starts is set in 'home:'.
    ); // MaterialApp() controls the overall app UI.

  }
}