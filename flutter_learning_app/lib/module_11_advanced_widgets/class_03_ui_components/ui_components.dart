import 'package:flutter/material.dart';

class Module11Class3 extends StatelessWidget {
  const Module11Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
      ),

      // GridView.builder is useful for large or dynamic grid data, such as API results.
      // It builds grid items when they are needed instead of writing every item manually.
      body: GridView.builder(
        itemCount: 20, // Limits the grid to 20 items; without a limit, it may keep building more items.
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // Controls the size, count, and spacing of grid cells.
          crossAxisCount: 3, // Displays 3 grid items in each row.
          crossAxisSpacing: 10, // Adds 10 pixels of horizontal space between columns.
          mainAxisSpacing: 10 // Adds 10 pixels of vertical space between rows.
          
          ), 
          // itemBuilder runs whenever GridView needs to create a grid item.
          // context represents the current widget location, and index is the current item number.
        itemBuilder: (context, index){
          return Column( // Places the icon box and text vertically inside each grid cell.
            mainAxisAlignment: MainAxisAlignment.center, // Centers the Column children vertically inside the grid cell.
            children: [
              Container(
                padding: EdgeInsets.all(5), // Creates visible red space around the inner Padding and image.
                decoration: BoxDecoration( // Adds visual design to the Container background.
                  // Rounds only the Container's decorated background.
                  // It does not crop or round the child image itself.
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [Colors.red, Colors.redAccent.shade100]) // Creates a red gradient background.
                ),
                 child: Padding(
                  padding: const EdgeInsets.all(8.0), // Adds empty space between the image and the red Container background.
                  child: Image.network(
                    "https://img.icons8.com/ios-filled/100/000000/phone.png", // Loads the phone icon from an internet URL.
                    height: 50, // Sets the height of the image box to 50 pixels.
                    width: 50, // Sets the width of the image box to 50 pixels.
                   fit: BoxFit.cover, // Fills the 50×50 image box while keeping the image ratio; parts may be cropped if needed.
                  ),
                ),
             
              ),
              Text("Calling...") // Displays text below the phone icon.
            ],
          );
        }
        
        ),







      
      // GridView.count is useful when the number of items is small and written manually.
      // GridView.count(
      //   crossAxisCount: 2, // Displays 2 grid items in each row.
      //   mainAxisSpacing: 10, // Adds vertical space between grid rows.
      //   crossAxisSpacing: 10, // Adds horizontal space between grid columns.
        
      //   children: [ // Contains manually added grid items.
      //     Container(
      //       height: 50, // Sets the Container height.
      //       width: 50, // Sets the Container width.
      //       color: Colors.red, // Sets the Container background color.
      //     ),
      //     Container(
      //       height: 50, // Sets the Container height.
      //       width: 50, // Sets the Container width.
      //       color: Colors.blue, // Sets the Container background color.
      //     ),
      //     Container(
      //       height: 50, // Sets the Container height.
      //       width: 50, // Sets the Container width.
      //       color: Colors.yellow, // Sets the Container background color.
      //     ),
      //     Container(
      //       height: 50, // Sets the Container height.
      //       width: 50, // Sets the Container width.
      //       color: Colors.orange, // Sets the Container background color.
      //     ),
      //     Container(
      //       height: 50, // Sets the Container height.
      //       width: 50, // Sets the Container width.
      //       color: Colors.purple, // Sets the Container background color.
      //     ),
      //     Container(
      //       height: 50, // Sets the Container height.
      //       width: 50, // Sets the Container width.
      //       color: Colors.green, // Sets the Container background color.
      //     ),
      //   ],
        
      //   )
      









      // Row places its children horizontally.
      // Row(
      //   // mainAxisAlignment: MainAxisAlignment.spaceBetween, // Keeps equal space only between items; no space at the edges.
      //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Keeps equal space between all items and both edges.
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,  // Gives equal space around each item; edge space appears smaller.
      //   children: [
      //     Container(
      //       height: 70, // Sets the Container height.
      //       width: 70, // Sets the Container width.
      //       color: Colors.red,), // Sets the Container background color.
      //     // Spacer(), // Takes the available flexible space between widgets.
      //     Container(
      //       height: 70, // Sets the Container height.
      //       width: 70, // Sets the Container width.
      //       color: Colors.blue,), // Sets the Container background color.
      //     // Spacer(), // Takes the available flexible space between widgets.
      //     Container(
      //       height: 70, // Sets the Container height.
      //       width: 70, // Sets the Container width.
      //       color: Colors.green, // Sets the Container background color.
      //     ),
      //   ],
      // ) 
    
    );
  }
}