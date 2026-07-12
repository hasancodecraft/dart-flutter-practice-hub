import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_02_navigation/navigation.dart';

class Home2 extends StatefulWidget {
  final String name; // Stores the name received from the previous page.
  final String location; // Stores the location received from the previous page.
  final Color color; // Stores the card color received from the previous page.
  
  // VoidCallback means a function that takes no input and returns nothing.
  // Here, onTap stores a function passed from the previous page.
  // This lets the previous page decide what will happen when this page's Submit button is pressed.
  final VoidCallback onTap;

  // required means these values must be passed when Home2 is created.
  // This is how we pass data from one page to another page.
  const Home2({super.key, required this.name, required this.location, required this.color, required this.onTap});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home2 Page"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Card(
          color: widget.color, // widget.color accesses the color value from the Home2 widget class.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              Text(widget.name, style: TextStyle( fontSize: 30),), // Shows the name received from navigation.
              Text(widget.location, style: TextStyle( fontSize: 30),), // Shows the location received from navigation.
              SizedBox(height: 20,),
          
              ElevatedButton(
                onPressed: widget.onTap, // Runs the function received from the previous page.
                child: Text("Submit")),
          
          
              ElevatedButton(
                onPressed: (){

                  // Navigator.pop closes the current page and goes back to the previous page.
                  Navigator.pop(context, MaterialPageRoute(builder: (context) => Module13Class2()));
                }, 
                child: Text("Back"))
            ],
          ),
        ),
      ),
    );
  }
}