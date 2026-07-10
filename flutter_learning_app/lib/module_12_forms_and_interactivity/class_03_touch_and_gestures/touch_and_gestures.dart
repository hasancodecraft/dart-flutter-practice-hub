import 'package:flutter/material.dart';

class Module12Class3 extends StatefulWidget {
  const Module12Class3({super.key});

  @override
  State<Module12Class3> createState() => _Module12Class3State();
}

class _Module12Class3State extends State<Module12Class3> {
  double dx = 0; // Stores horizontal movement value.
  double dy = 0; // Stores vertical movement value.
  double scale = 1.0; // Stores zoom size; 1.0 means normal size.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Touch & Gestures",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          Text("Drag / Pan"),

          // GestureDetector detects user gestures like drag, tap, scale, etc.
          // onPanUpdate works when the user drags in any direction.
          GestureDetector(
            onPanUpdate: (details){
              setState(() {
                dx += details.delta.dx; // Adds horizontal drag movement to dx.
                dy += details.delta.dy; // Adds vertical drag movement to dy.
              });
            },

            // Transform.translate moves the child widget from its original position.
            child: Transform.translate(
              offset: Offset(dx, dy), // Moves the widget by dx horizontally and dy vertically.
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Center(child: Text("Drag me!!", style: TextStyle(
                  color:Colors.white
                ),)),
              ),
            ),
          ),

          SizedBox(height: 40,),

          Text("Horizontal Drag"),

          // onHorizontalDragUpdate works only for left-right drag movement.
          GestureDetector(
            onHorizontalDragUpdate: (details){
              setState(() {
                dx += details.delta.dx; // Updates only horizontal position.
              });
            },

             child: Transform.translate(
              offset: Offset(dx, dy), // Uses updated dx to move horizontally.
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Center(child: Text("Drag me!!", style: TextStyle(
                  color:Colors.white
                ),)),
              ),
            ),
    
          ),

          SizedBox(height: 40,),

          Text("Vertical Drag"),


          // onVerticalDragUpdate works only for up-down drag movement.
          GestureDetector(
            onVerticalDragUpdate: (details){
              setState(() {
                dy += details.delta.dy; // Updates only vertical position.
              });
            },

             child: Transform.translate(
              offset: Offset(dx, dy), // Uses updated dy to move vertically.
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: Center(child: Text("Drag me!!", style: TextStyle(
                  color:Colors.white
                ),)),
              ),
            ),
    
          ),

           SizedBox(height: 40,),

          Text("Scale"),

          // onScaleUpdate works during pinch/zoom gesture.
          // details.scale gives the live scale value from the user's gesture.
          GestureDetector(
            onScaleUpdate: (details){
              setState(() {
                scale += details.scale; // Adds gesture scale to current scale; this can grow very fast.
              });
            },

            // Transform.scale changes the visual size of the child widget.
            child: Transform.scale(
              scale: scale, // 1.0 = normal, greater than 1 = bigger, less than 1 = smaller.
              child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.pink,
                  child: Center(child: Text("Zoom me!!", style: TextStyle(
                    color:Colors.white
                  ),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}