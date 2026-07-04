import 'package:flutter/material.dart';

class Module11class1 extends StatelessWidget {
  const Module11class1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text and Image", style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // Two common image sources: network and asset
          children: [
            // Loads an image from an internet URL
            Image.network("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/e2/f8/43/longest-sea-beach-in.jpg?w=1100&h=-1&s=1",
        
            // Height and width create a box for the image
            // height: 100 and width: 100 create a square box
            // The landscape picture keeps its original shape inside the square box
        
            // height: 100 and width: 400 create a wide box
            // The picture keeps its original shape inside the wide box
            // Any remaining empty space is divided between both sides
            // Therefore, the visible picture may look centered inside the box
        
            // Column keeps the whole Image widget horizontally centered
            // The image is also centered inside its own width and height box
            height: 200,
            width: 400,
            // Fills the complete image box while keeping the image ratio
            // Some parts of the image may be cropped
            fit: BoxFit.cover,),
            // Creates 10 pixels of vertical space
            SizedBox(
              height: 10,
            ), 
        
            // Loads an image from the project's asset folder
            // The asset must also be registered in pubspec.yaml
            Image.asset("asset/YT.png",
              // Fills the available image box while keeping the image ratio
              fit: BoxFit.cover,),
        
            // Creates 10 pixels of vertical space
            SizedBox(
              height: 10,
            ),
            
            // Adds space around the TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
              // TextField allows the user to enter text
              child: TextField(
                // Requests a phone-number keyboard from the device
                keyboardType: TextInputType.phone,
                // InputDecoration customizes the TextField's appearance
                decoration: InputDecoration(
                  // Appears below the TextField
                  helperText: "Phone Number",
                  // Appears inside the TextField when it is empty
                  hintText: "Enter  your Phone Number",
                  // Appears inside the field and floats above when focused
                  labelText: "Phone Number",
              
                  // Customizes the helper text
                  helperStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),
                  // Customizes the hint text
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  // Customizes the label text
                 labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                   ),
                   // Shows an icon before the input text
                   prefixIcon: Icon(Icons.phone),
                   // Shows an icon after the input text
                   suffixIcon: Icon(Icons.check_box),
                   // Creates a visible border around the TextField
                   border: OutlineInputBorder(
                    // Makes the border corners rounded
                    borderRadius: BorderRadius.circular(10)
                   )
                   
                   ),),
            ),
            // Creates 10 pixels of vertical space
            SizedBox(
              height: 10,
            ),
            // Adds space around the password TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // Hides the entered characters for password input
                obscureText: true,
                // Requests a keyboard suitable for password input
                keyboardType: TextInputType.visiblePassword,
                // InputDecoration customizes the TextField's appearance
                decoration: InputDecoration(
                  // Appears below the TextField
                  helperText: "Password",
                  // Appears inside the TextField when it is empty
                  hintText: "Enter your Password",
                  // Appears inside the field and floats above when focused
                  labelText: "Password",
              
                  // Customizes the helper text
                  helperStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),
                  // Customizes the hint text
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  // Customizes the label text
                 labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                   ),
                   // Shows a lock icon before the input text
                   prefixIcon: Icon(Icons.lock),
                   // Only displays an eye icon; it is not clickable yet
                   suffixIcon: Icon(Icons.remove_red_eye),
                   // Creates a visible border around the TextField
                   border: OutlineInputBorder(
                    // Makes the border corners rounded
                    borderRadius: BorderRadius.circular(10)
                   )
                   
                   ),),
            )
        
             ],
           
        ),
      ),
    );
  }
}