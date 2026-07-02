import 'package:flutter/material.dart';

class Class03 extends StatelessWidget {
  const Class03({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery provides information about the current screen.
    // Gets the current device screen width and height.
    // Gets the current screen orientation: portrait or landscape.
    Size screenSize = MediaQuery.of(context).size; // Stores the current screen size.
    double screenW = screenSize.width; // Stores the current screen width.
    double screenH = screenSize.height; // Stores the current screen height.
    final Orientation orientation = MediaQuery.of(context).orientation; // Stores the current screen orientation.
    return Scaffold(
      appBar: AppBar(
        title: Text("Class 3"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child:orientation == Orientation.portrait ?  Column( // Shows a Column when the screen is in portrait mode.
          children: [

            Text(orientation.toString(),style: TextStyle(fontSize: 15),), // Displays the current screen orientation.


            Container(
              height: 100,
              width: 100,
              child: Text("sdfdjfhsjkffffffffffffffffhsdiusuihsdiufshduihfsdhiushdifuhsdiufhsdhiufhsdivbsdibsbdvbsdiuvbsbvbsdviubsdiuvbisudbviusdbiusbdvibsdiuvbsdiuvbsidubvsdbsdbibibivbsdibisdbvsbdvibsdvbsdvbisbviusbvbsdvbiusbviubsdvbisdfdjfhsjkffffffffffffffffhsdiusuihsdiufshduihfsdhiushdifuhsdiufhsdhiufhsdivbsdibsbdvbsdiuvbsbvbsdviubsdiuvbisudbviusdbiusbdvi", 
                style: TextStyle(
                  fontSize: 25,
                  overflow: TextOverflow.ellipsis, // Replaces overflowing text with three dots (...).
              ),textAlign: TextAlign.center,  // Aligns the text horizontally in the center of its available space.
                maxLines: 2, // Limits the Text widget to a maximum of two lines.
              ),
            ),
        
            RichText( // Displays text with multiple styles inside one text block.
              text: TextSpan( // Defines the main text style and holds additional styled TextSpan children.
              text: 'Don\'t have an account??',
              style: TextStyle(
                fontSize: 10, color: Colors.black,),
              children: [
                TextSpan(
                  text: " Sign Up" ,
        
                  style: TextStyle(
                fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                )
              ]  
            )),
            Text("Hello with out",style: TextStyle(fontSize: 25),),
            Container(
              height: 150,
              width: 150,
              color: Colors.yellow,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: screenH * 0.25, // Uses 25% of the current screen height.
              width: screenW * 0.3, // Uses 30% of the current screen width.
              color: Colors.red,
            ),
            Text("with MediaQuary",style: TextStyle(fontSize: 25),)
          ],
        ) :

        SingleChildScrollView( // Enables horizontal scrolling in landscape mode to prevent horizontal overflow.
          scrollDirection: Axis.horizontal, // Sets the scrolling direction from left to right.
          child: Row( // Arranges all children horizontally in landscape mode.
            children: [
          
              Text(orientation.toString(),style: TextStyle(fontSize: 15),), // Displays the current screen orientation.
          
          
              Container(
                height: 100,
                width: 100,
                child: Text("sdfdjfhsjkffffffffffffffffhsdiusuihsdiufshduihfsdhiushdifuhsdiufhsdhiufhsdivbsdibsbdvbsdiuvbsbvbsdviubsdiuvbisudbviusdbiusbdvibsdiuvbsdiuvbsidubvsdbsdbibibivbsdibisdbvsbdvibsdvbsdvbisbviusbvbsdvbiusbviubsdvbisdfdjfhsjkffffffffffffffffhsdiusuihsdiufshduihfsdhiushdifuhsdiufhsdhiufhsdivbsdibsbdvbsdiuvbsbvbsdviubsdiuvbisudbviusdbiusbdvi", 
                  style: TextStyle(
                    fontSize: 25,
                    overflow: TextOverflow.ellipsis, // Replaces overflowing text with three dots (...).
                ),textAlign: TextAlign.center,  // Aligns the text horizontally in the center of its available space.
                  maxLines: 2, // Limits the Text widget to a maximum of two lines.
                ),
              ),
          
              RichText( // Displays text with multiple styles inside one text block.
                text: TextSpan( // Defines the main text style and holds additional styled TextSpan children.
                text: 'Don\'t have an account??',
                style: TextStyle(
                  fontSize: 10, color: Colors.black,),
                children: [
                  TextSpan(
                    text: " Sign Up" ,
          
                    style: TextStyle(
                  fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ]  
              )),
              Text("Hello with out",style: TextStyle(fontSize: 25),),
              Container(
                height: 150,
                width: 150,
                color: Colors.yellow,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: screenH * 0.25, // Uses 25% of the current screen height.
                width: screenW * 0.3, // Uses 30% of the current screen width.
                color: Colors.red,
              ),
              Text("with MediaQuary",style: TextStyle(fontSize: 25),)
            ],
          ),
        ),
      
      ) ,
    );
  }
}