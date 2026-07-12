import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_02_navigation/pages/about.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_02_navigation/pages/home2.dart';

class Module13Class2 extends StatefulWidget {
  const Module13Class2({super.key});

  @override
  State<Module13Class2> createState() => _Module13Class2State();
}

class _Module13Class2State extends State<Module13Class2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Navigation", style: TextStyle(
          fontSize: 25, color: Colors.orange
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){

                // Navigator.push opens a new page on top of the current page.
                // MaterialPageRoute creates the route/page transition for the new page.
                // builder returns the page widget that will be opened.
                // Here, Home2 page receives data through constructor values.
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home2(name: "Hasan", location: "Dhaka", color: Colors.red, onTap: () { 
                  print("Submitted"); // This function is sent to Home2 and will run from Home2's Submit button.
                 },)));
              }, 
              child: Text("Home", style: TextStyle(color: Colors.orange
          ),),),
          
            ElevatedButton(
              onPressed: (){

              // pushReplacement opens a new page and removes/replaces the current page.
              // After using pushReplacement, the user usually cannot go back to this page using the back button.
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> About()));

              // ScaffoldMessenger shows a temporary message at the bottom of the screen.
              // SnackBar is useful for success, error, or short feedback messages.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Saved successfully"))
              );
              }, 
              child: Text("About", style: TextStyle(color: Colors.orange
          ),),),
          
            ElevatedButton(
              onPressed: (){

                // pushNamed opens a page using a route name.
                // The route name "/test" must be registered in MaterialApp routes/onGenerateRoute.
                Navigator.pushNamed(context, "/test");

                // pushReplacementNamed also opens a named route, but replaces the current page.
                // Navigator.pushReplacementNamed(context, "/test"); // for remove back buttion in page connection 
              }, 
              child: Text("Test", style: TextStyle(color: Colors.orange
          ),),),
          
          ],
        ),
      ),
    );
  }
}