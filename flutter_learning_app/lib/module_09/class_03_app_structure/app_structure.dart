import 'package:flutter/material.dart';

class Class3 extends StatelessWidget{
  const Class3({super.key});

Widget build(BuildContext context){
  return Scaffold(
    // Three ways to use color shades and opacity:
    //backgroundColor: Colors.grey[500], // Uses a specific grey shade.
    //backgroundColor: Colors.grey.withOpacity(0.80), // Uses grey with 80% opacity.
    backgroundColor: Colors.grey.shade100,

    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text("Basic",style: TextStyle(),),
    ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton( // Creates a clickable elevated button.
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5) // Changes the button's corner radius.
                )
              ) ,
              onPressed: (){}, child:Text("Done", style: TextStyle(fontSize: 20),) ),
           
            SizedBox(
              height: 10 ,
            ),
            SizedBox(
              height: 50,
              width: 150, // Sets the button width to 150.
              child: ElevatedButton( // Creates a clickable elevated button.
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5) // Changes the button's corner radius.
                  )
                ) ,
                onPressed: (){}, child:Text("Done", style: TextStyle(fontSize: 20),) ),
            ),

            SizedBox(
              height: 10 ,
            ),
             SizedBox(
              height: 60,
              width: double.infinity , // Makes the button take the full available horizontal width.
              child: ElevatedButton( // Creates a clickable elevated button.
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5) // Changes the button's corner radius.
                  )
                ) ,
                onPressed: (){}, child:Text("Done", style: TextStyle(fontSize: 20),) ),
            ),

            SizedBox(
              height: 10 ,
            ),

            OutlinedButton( // Creates an outlined-style button.
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
                textStyle: TextStyle( fontWeight: FontWeight.bold),
              ),
              onPressed: (){}, child: Text("Submit")),

            TextButton(onPressed: (){}, child: Text("See more")),  // Creates a text-based button.
            Icon(Icons.people_outline_rounded,size: 50,color: Colors.blue,), // Displays a normal, non-clickable icon.
            IconButton(onPressed: (){}, icon: Icon(Icons.add_home), color: Colors.red,iconSize: 50,), // Creates a clickable icon button.

            GestureDetector( // Detects different gestures but does not show a ripple effect by default(Many functionalities).
              onTap:(){
                print('one tap');
              },
              onDoubleTap: (){
                print("double tap");
              },
              onLongPress: (){
                print("long press");
              },
              child: Text("Clickable", style: TextStyle(fontSize: 30),)), 

            InkWell( // Makes a widget clickable and shows a Material ripple effect(less functionalities).
              onTap:(){
                print('1 tap');
              },
              onDoubleTap: (){
                print("2 tap");
              },
              onLongPress: (){
                print("Long tap");
              },
              child: Text("Clickable2", style: TextStyle(fontSize: 30),)),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton( // Creates a floating action button; its default position is on the right.
        onPressed: (){}, 
        child: Icon(Icons.add),),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat , // Moves the floating action button to the left.
  );
}

}