import 'package:flutter/material.dart';

class CityCard extends StatelessWidget { // Reusable card widget; same design can show different city data.
  final String imageURL, title, rating; // Values received from CustomW and used inside this CityCard.
  const CityCard({ // Constructor receives required city data when CityCard is called.
    super.key, required this.imageURL, required this.title, required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      child: Stack(
        children: [

          // Positioned.fill makes its child take the full size of the Stack.
          // Here, the Stack is inside a Container with height 230 and width double.infinity.
          // So this Image.network gets the full 230-height and full-width card area.
          // It only controls the image widget's position and size; image crop/fit is controlled by BoxFit.
          Positioned.fill(
            child: Image.network(imageURL, // Uses the received imageURL as the background image.
            // height: 230,
            // width: double.infinity,
            //fit: BoxFit.cover, // give it a good comment that you tell
            //fit: BoxFit.contain,
            ),
          ),
          Container(
              color: Colors.black38,
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Text(title, // Shows the received city title on the card.
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),),
          ),
       
          Positioned(
            top: 20,
            right: 20,
            child: Text("⭐ $rating ", // Shows the received rating with a star icon.
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),
       
        ],
      
      ),
    );
  }
}