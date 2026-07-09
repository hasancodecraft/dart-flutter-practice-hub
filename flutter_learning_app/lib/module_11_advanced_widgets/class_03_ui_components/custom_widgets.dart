import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/widget/city_card.dart'; // Imports the reusable CityCard widget from the widget folder.

class CustomW extends StatelessWidget {
  const CustomW({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Widget",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CityCard(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQSCCG3jdtIkgBXFjjnf9zoE8n7GMPw3X5DLJurHVUkttEsPRrFySoHGXc&s=10", title: "Cox's Bazar", rating: "4.8"), // Sends Cox's Bazar data to the reusable CityCard widget.
            SizedBox(height: 10,),
            CityCard(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZiJp1v3DU_Y1cckO5C-XeOmB1msRl1FPMtEQunpDGVQ&s=10", title: "Bandarban", rating: "4.9"), // Sends Bandarban data to the same CityCard design.
            SizedBox(height: 10,),
            CityCard(imageURL: "https://www.musafir.com.bd/images/locations/Bisnakandi-Sylhet.jpg", title: "Sylhet", rating: "4.7"), // Sends Sylhet data to reuse the same card layout.
            SizedBox(height: 10,),
        
          ],
        ),
      ),

    
    );
  }
}