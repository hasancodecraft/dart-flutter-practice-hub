import 'package:flutter/material.dart'; // Imports Flutter's Material UI widgets, such as Scaffold, AppBar, Column, SingleChildScrollView, and SizedBox.
import 'package:module_09_flutter_basics/module_11_advanced_widgets/widget/City_Card.dart'; // Imports the reusable CityCard widget so it can be used on this screen.

class CustomW extends StatelessWidget { // Creates a custom widget practice screen using StatelessWidget because this UI has no changing state.
  const CustomW({super.key}); // Constructor for this widget; super.key helps Flutter identify this widget in the widget tree.

  @override // Tells Dart that this build method is overriding the build method from StatelessWidget.
  Widget build(BuildContext context) { // build() creates and returns the UI of this screen.
    return Scaffold( // Scaffold gives the basic page structure with AppBar and body.
      appBar: AppBar( // Creates the top app bar of this screen.
        title: Text("Custom Widget",style: TextStyle(fontWeight: FontWeight.bold),), // Shows "Custom Widget" as the AppBar title and makes it bold.
        backgroundColor: Colors.cyanAccent, // Sets the AppBar background color to cyanAccent.
        centerTitle: true, // Places the AppBar title in the center.
      ),
      body: SingleChildScrollView( // Makes the body vertically scrollable, useful when multiple CityCards take more height than the screen.
        child: Column( // Places all CityCard widgets vertically one after another.
          children: [ // Holds multiple widgets inside the Column.
            CityCard(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQSCCG3jdtIkgBXFjjnf9zoE8n7GMPw3X5DLJurHVUkttEsPRrFySoHGXc&s=10", title: "Cox's Bazar", rating: "4.8"), // Reuses CityCard and sends imageURL, title, and rating values for Cox's Bazar.
            SizedBox(height: 10,), // Adds 10 pixels of vertical space between CityCards.
            CityCard(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZiJp1v3DU_Y1cckO5C-XeOmB1msRl1FPMtEQunpDGVQ&s=10", title: "Bandarban", rating: "4.9"), // Reuses CityCard and sends imageURL, title, and rating values for Bandarban.
            SizedBox(height: 10,), // Adds 10 pixels of vertical space between CityCards.
            CityCard(imageURL: "https://www.musafir.com.bd/images/locations/Bisnakandi-Sylhet.jpg", title: "Sylhet", rating: "4.7"), // Reuses CityCard and sends imageURL, title, and rating values for Sylhet.
            SizedBox(height: 10,), // Adds 10 pixels of space after the last CityCard.
        
          ],
        ),
      ),

    
    );
  }
}