import 'package:flutter/material.dart';

class Module11Class2 extends StatelessWidget {
  const Module11Class2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class 2"),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),

      body: ListView.separated( // Builds list items with separators between them
        itemCount: 20, // Total number of list items
        itemBuilder: (context, index){ // context is the widget location; index is the current item number
          return Card( // Adds a Material-style card around each list item
            child: ListTile( // Arranges leading, title, subtitle, and trailing in one row
                title: Text('Hasan ${index}'), // Shows the current index with the name
                subtitle: Text('015061665116511'), // Shows secondary text below the title
                leading: Icon(Icons.phone), // Shows an icon at the beginning
                trailing: Icon(Icons.delete, color: Colors.red,), // Shows an icon at the end
              ),
          );
        }, 
        separatorBuilder: (context, index){ // Builds a separator between two list items
          return Divider( // Adds a horizontal dividing line
            thickness: 5, // Sets the divider thickness
            color: Colors.red, // Sets the divider color
          );
        }) 
    






      // ListView.builder is used when the list has many or dynamic items.
      // It does not build every item at once.
      // It builds only the items needed for the visible screen.
      // When the user scrolls, it builds the next items using itemBuilder.
      // This saves memory and keeps the app smooth.

      //ListView.builder( // Builds list items only when they are needed
      //   //scrollDirection: Axis.horizontal, // Displays the list horizontally
      //   itemCount: 20, // Total number of items, often received from an API response
      //   itemBuilder: (context, index){ // Runs for each needed item; index gives the current item number
      //     return ListTile( // Arranges leading, title, subtitle, and trailing in one row
      //         title: Text('Hasan ${index}'), // Shows the current index with the name
      //         subtitle: Text('015061665116511'), // Shows secondary text below the title
      //         leading: Icon(Icons.phone), // Shows an icon at the beginning
      //         trailing: Icon(Icons.delete, color: Colors.red,), // Shows an icon at the end
      //       );
      //   },
      //   )







      // body: ListView( // Creates a scrollable list with manually added children
      //   // ListView is automatically scrollable
      //   // It can hold multiple child widgets
      //   children: [
      //     Card( // Adds a Material-style card around the list item
      //       child: ListTile( // Arranges leading, title, subtitle, and trailing in one row
      //         title: Text('Hasan'), // Shows the main text
      //         subtitle: Text('015061665116511'), // Shows secondary text below the title
      //         leading: Icon(Icons.phone), // Shows an icon at the beginning
      //         trailing: Icon(Icons.delete, color: Colors.red,), // Shows an icon at the end
      //       ),
      //     ),

   
      //     Card( // Adds a Material-style card around the list item
      //       child: ListTile( // Arranges leading, title, subtitle, and trailing in one row
      //         title: Text('Hasan'), // Shows the main text
      //         subtitle: Text('015061665116511'), // Shows secondary text below the title
      //         leading: Icon(Icons.phone), // Shows an icon at the beginning
      //         trailing: Icon(Icons.delete, color: Colors.red,), // Shows an icon at the end
      //       ),
      //     ),

   
      //     Card( // Adds a Material-style card around the list item
      //       child: ListTile( // Arranges leading, title, subtitle, and trailing in one row
      //         title: Text('Hasan'), // Shows the main text
      //         subtitle: Text('015061665116511'), // Shows secondary text below the title
      //         leading: Icon(Icons.phone), // Shows an icon at the beginning
      //         trailing: Icon(Icons.delete, color: Colors.red,), // Shows an icon at the end
      //       ),
      //     ),

   
      //     Card( // Adds a Material-style card around the list item
      //       child: ListTile( // Arranges leading, title, subtitle, and trailing in one row
      //         title: Text('Hasan'), // Shows the main text
      //         subtitle: Text('015061665116511'), // Shows secondary text below the title
      //         leading: Icon(Icons.phone), // Shows an icon at the beginning
      //         trailing: Icon(Icons.delete, color: Colors.red,), // Shows an icon at the end
      //       ),
      //     )

   
      //   ],
      // )
    );
  }
}