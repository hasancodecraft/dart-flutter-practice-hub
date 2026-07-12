import 'package:flutter/material.dart';

// This page is used as a named route destination.
// It can be opened using Navigator.pushNamed(context, "/test").
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}