import 'package:flutter/material.dart';

class Module11class1 extends StatelessWidget {
  const Module11class1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController =
        TextEditingController(); // Controls and reads the phone input

    TextEditingController passwordController =
        TextEditingController(); // Controls and reads the password input

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Text and Image",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // Two common image sources: network and asset
          children: [
            // Loads an image from an internet URL
            Image.network(
              "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/e2/f8/43/longest-sea-beach-in.jpg?w=1100&h=-1&s=1",

              // Height and width create a box for the image
              // A square box and a landscape image have different shapes
              // Extra space may appear if the image does not fill the box
              // The Image widget stays horizontally centered inside the Column
              height: 200, // Image box height
              width: 400, // Image box width

              // Fills the box while keeping the image ratio
              // Some parts of the image may be cropped
              fit: BoxFit.cover,
            ),

            SizedBox(
              height: 10, // Creates 10 pixels of vertical space
            ),

            // Loads an image from the project's asset folder
            // The asset path must also be registered in pubspec.yaml
            Image.asset(
              "asset/YT.png",
              fit: BoxFit.cover, // Fills the available image box
            ),

            SizedBox(
              height: 10, // Creates 10 pixels of vertical space
            ),

            Padding(
              padding: const EdgeInsets.all(8.0), // Adds space around the field
              child: TextField(
                controller:
                    phoneController, // Connects the field to phoneController
                keyboardType:
                    TextInputType.phone, // Opens a phone-number keyboard
                decoration: InputDecoration(
                  helperText: "Phone Number", // Appears below the field
                  hintText:
                      "Enter  your Phone Number", // Appears inside an empty field
                  labelText:
                      "Phone Number", // Floats above when the field is focused

                  helperStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ), // Customizes the helper text

                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ), // Customizes the hint text

                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ), // Customizes the label text

                  prefixIcon:
                      Icon(Icons.phone), // Shows an icon before the input
                  suffixIcon:
                      Icon(Icons.check_box), // Shows an icon after the input

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ), // Makes the border corners rounded
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10, // Creates 10 pixels of vertical space
            ),

            Padding(
              padding: const EdgeInsets.all(
                8.0,
              ), // Adds space around the password field
              child: TextField(
                controller:
                    passwordController, // Connects the field to passwordController
                obscureText: true, // Hides the entered password characters
                keyboardType: TextInputType.visiblePassword, // Opens a keyboard suitable for passwords
                decoration: InputDecoration(
                  helperText: "Password", // Appears below the field
                  hintText:
                      "Enter your Password", // Appears inside an empty field
                  labelText:
                      "Password", // Floats above when the field is focused

                  helperStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ), // Customizes the helper text

                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ), // Customizes the hint text

                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ), // Customizes the label text

                  prefixIcon:
                      Icon(Icons.lock), // Shows a lock icon before the input

                  // This eye icon is only displayed
                  // It is not clickable yet
                  suffixIcon: Icon(Icons.remove_red_eye),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ), // Makes the border corners rounded
                  ),
                ),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,50,), // Uses full available width and 50 height

                textStyle:TextStyle(fontSize: 20), // Sets the button text size

                // A SizedBox can also control the button's width and height
                backgroundColor:
                    Colors.lightBlueAccent, // Sets the button background color
                foregroundColor:
                    Colors.indigo, // Sets the button text and icon color
              ),
              onPressed: () {
                print(phoneController.text); // Prints the entered phone number
                print(passwordController.text); // Prints the entered password
              },
              child: Text("Submit"), // Text displayed inside the button
            ),
          ],
        ),
      ),
    );
  }
}