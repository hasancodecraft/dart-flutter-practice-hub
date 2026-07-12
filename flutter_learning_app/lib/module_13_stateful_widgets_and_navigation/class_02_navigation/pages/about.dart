import 'package:flutter/material.dart';

// This page is used as a destination page for navigation.
// Module13Class2 opens this page using Navigator.pushReplacement().
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Page"),
        backgroundColor: Colors.pink,
      ),
    );
  }
}