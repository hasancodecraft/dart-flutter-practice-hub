import 'package:flutter/material.dart';

class Class2 extends StatelessWidget {
  const Class2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          Center(child: Text("Hello World", style: TextStyle(fontSize: 25),)), // Center takes the available horizontal width and centers its child.
          Align(
            alignment: Alignment.topRight, // Positions the child at the top-right of the available space.
            child: Text("Hello World 2", style: TextStyle(fontSize: 25))),  // Align controls the position of this Text inside its available space.

          Container(
            padding: EdgeInsets.all(15), // Creates space inside the Container around its child.
            margin: EdgeInsets.all(15), // Creates space outside the Container.
            alignment: Alignment.topRight, // Places the child at the top-right inside the Container.

            height: 180,
            width: 180,

            decoration: BoxDecoration(
              //color: Colors.blueGrey,
              gradient: LinearGradient(colors: [Colors.green, Colors.red, Colors.yellowAccent], // Blends multiple colors in a straight line.
              begin: Alignment.topRight, // Sets where the gradient starts.
              end: Alignment.bottomCenter), // Sets where the gradient ends.
              border: Border.all(width: 2, color: Colors.black), // Adds a black border around the Container.
              //borderRadius: BorderRadius.circular(10),
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10) ), // Rounds only the specified corners.
              boxShadow: [ // Adds one or more shadows around the Container.
                BoxShadow(
                  color: Colors.red,
                  offset: Offset(10, 10), // Moves the shadow to the right and downward.
                  spreadRadius: 5, // Increases the size of the shadow.
                  blurRadius: 5, // Controls how soft or blurry the shadow appears.
                ),
                BoxShadow(
                  color: Colors.brown,
                  offset: Offset(-10, -10), // Moves the shadow to the left and upward.
                  spreadRadius: 5, // Increases the size of the shadow.
                  blurRadius: 5, // Controls how soft or blurry the shadow appears.
                )
              ]
            ),
            child: Text("Hello Flutter", style: TextStyle(fontSize: 25)),
          )
        ],
      ),
    );
  }
}