import 'package:flutter/material.dart'; // Imports Flutter's Material UI widgets, such as Container, Stack, Positioned, Image, Text, and Colors.

class CityCard extends StatelessWidget { // Creates a reusable city card widget that can be used many times with different data.
  final String imageURL, title, rating; // Stores the image link, city title, and rating text received from the parent widget.
  const CityCard({ // Constructor receives required values from where CityCard is called.
    super.key, required this.imageURL, required this.title, required this.rating // Makes imageURL, title, and rating required so every CityCard must provide these values.
  });

  @override // Tells Dart that this build method is overriding the build method from StatelessWidget.
  Widget build(BuildContext context) { // build() creates and returns the UI of this reusable CityCard.
    return Container( // Creates the main card box that controls the card size.
      height: 230, // Sets the CityCard height to 230 pixels.
      width: double.infinity, // Makes the CityCard take the full available screen width.
      child: Stack( // Places widgets on top of each other, useful for background image, overlay, and positioned text.
        children: [ // Holds multiple layered widgets inside the Stack.
          Positioned.fill( // Makes the image widget fill the full Stack area.
            child: Image.network(imageURL, // Loads the background image from the imageURL value passed to CityCard.
            // height: 230, // If enabled, sets image height to 230 pixels; currently not needed because Positioned.fill controls the image area.
            // width: double.infinity, // If enabled, makes image width full; currently not needed because Positioned.fill controls the image area.
            //fit: BoxFit.cover, // If enabled, fills the full image area while keeping image ratio; extra parts may be cropped.
            //fit: BoxFit.contain, // If enabled, shows the full image while keeping image ratio; empty space may remain.
            ),
          ),
          Container( // Creates a dark layer over the image so white text becomes easier to read.
              color: Colors.black38, // Adds a semi-transparent black overlay on top of the image.
          ),
          Positioned( // Places the city title at a fixed position over the image.
            top: 20, // Keeps the title 20 pixels away from the top of the card.
            left: 20, // Keeps the title 20 pixels away from the left side of the card.
            child: Text(title, // Shows the city title value passed from the parent widget.
            style: TextStyle( // Adds text design for the city title.
              color: Colors.white, // Makes the title text white so it is visible on the dark overlay.
              fontSize: 20 // Sets the title text size to 20.
            ),),
          ),
       
          Positioned( // Places the rating text at a fixed position over the image.
            top: 20, // Keeps the rating 20 pixels away from the top of the card.
            right: 20, // Keeps the rating 20 pixels away from the right side of the card.
            child: Text("⭐ $rating ", // Shows a star icon with the rating value passed from the parent widget.
            style: TextStyle( // Adds text design for the rating.
              color: Colors.white, // Makes the rating text white so it is visible on the dark overlay.
              fontSize: 20, // Sets the rating text size to 20.
              fontWeight: FontWeight.bold // Makes the rating text bold.
            ),),
          ),
       
        ],
      
      ),
    );
  }
}