import 'package:flutter/material.dart';

class Class1 extends StatelessWidget {
  const Class1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Dark", style: TextStyle(color: Colors.brown.shade800, fontWeight: FontWeight.bold, fontSize: 28),),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centers all children vertically inside the Column.
        children: [
          Container(
            // padding: EdgeInsets.all(10), // Creates space inside the Container.
            // margin: EdgeInsets.all(50), // Creates space outside the Container.
            alignment: Alignment.center, // Centers the child inside the Container.
            height: 100,
            width: 100,
            transform: Matrix4.rotationZ(0.3),// Rotates the Container around the Z-axis.
            decoration: BoxDecoration(  // Used to design the Container.
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(12), // Rounds the corners of the Container.
              border: Border.all(width: 3,color: Colors.red), // Adds a red border around the Container.
              boxShadow: [
                BoxShadow( // Creates a shadow effect.
                  color: Colors.black12,
                  offset: Offset(10, 10), // Sets the shadow position on the X and Y axes.
                  blurRadius: 4) // Controls how blurry the shadow appears.
              ]
              ),
            child: Text("Hi",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          ),

          SizedBox( // Creates a vertical gap between the two Containers.
            height: 10,
          ),

          Container(
            margin: EdgeInsets.all(16), // Creates space outside the Container.
            padding: EdgeInsets.all(12), // Creates space inside the Container.
            decoration: BoxDecoration( // Used to design the Container.
              color: Colors.white,
              borderRadius: BorderRadius.circular(16), // Rounds the corners of the Container.
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10, // Controls how blurry the shadow appears.
                )
              ]
            ),
            child: Row( // Arranges its children horizontally.
              children: [
                CircleAvatar(radius: 30,
                backgroundImage: NetworkImage("https://scdn.speedsize.com/653debbb-d4a4-43dc-aac9-c44f9620f59a/https://snibbs.co/cdn/shop/articles/What_are_the_Challenges_of_Being_a_Doctor.jpg?v=1684314843"),), // Creates a circular avatar using a network image.
                SizedBox(width: 12,), // Creates a horizontal gap between the avatar and the text.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligns all text to the start of the Column.
                  children: [
                    Text("Dr.Hossain", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("dermatologist")]
                ),
                
              ],
            ),
          ),
          Stack( // Places widgets on top of one another.
            alignment: Alignment.center, // Centers the non-positioned children inside the Stack.
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              Container( // This Container appears on top of the previous Container.
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                ),
              )
            ],
          ),
          SizedBox( // Creates a vertical gap.
            height: 10,
          ),
          Stack( // Places widgets on top of one another.
            alignment: Alignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                ),
              ),
              Positioned( // Places a widget at a specific position inside the Stack.
                top: 10,
                right: 10,
                child: Container( // This Container appears on top of the previous Container.
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
    );
  }
}