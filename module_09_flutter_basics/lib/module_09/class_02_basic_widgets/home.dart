import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold() is like an empty canvas.
    return Scaffold(
      appBar: AppBar( // Top bar of the app
      
        backgroundColor:  Colors.brown, // Use Colors for predefined colors.
        title: Text("Flutter"), // Use Text("") to display text.
        // By default, the title is aligned to the left on Android and centered on iOS.
        centerTitle: true, // Centers the title.
      ),

      // The body allows only one child, so we use a Column or Row widget.
      // By default, a Column arranges its children from top to bottom.
      body: SingleChildScrollView(
        child: Column( // A Column allows multiple children.
          // Items outside children are properties.
          // For a Column, the vertical direction is the main axis.
          // For a Column, the horizontal direction is the cross axis.
          mainAxisAlignment: MainAxisAlignment.center, // Centers the Column's children vertically along the main axis.
          crossAxisAlignment: CrossAxisAlignment.end, // Moves the Column's children to the right, but a full-width child like this scroll view cannot visibly move.
          
          // Items inside children are widgets.
          children: [   
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),

          
          // By default, a Row arranges its children from left to right.
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.end, // Aligns the Row's children at the end of the main axis.
            children: [  
            // The Row arranges its children horizontally. 
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.redAccent)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.redAccent)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.redAccent)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.redAccent)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.redAccent)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),            
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
            Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green))
            ]
                    ),
          ),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
          Text("Heyyy", style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold,color: Colors.green)),
            ] 
          ),
      )
    ); 
  }
}