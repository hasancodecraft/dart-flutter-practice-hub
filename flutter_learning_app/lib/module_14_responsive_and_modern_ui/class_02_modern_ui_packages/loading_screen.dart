import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class Module14Class2Loading extends StatefulWidget {
  const Module14Class2Loading({super.key});

  @override
  State<Module14Class2Loading> createState() => _Module14Class2LoadingState();
}

class _Module14Class2LoadingState extends State<Module14Class2Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Loading package:
        // shimmer

        // Shimmer is commonly used to display animated placeholder shapes
        // while real data, images, or API responses are still loading.
    
        body: SafeArea(

          // ListView.builder is vertically scrollable by default.
          // Therefore, a separate SingleChildScrollView is not needed here.
          //
          // It creates only the visible list items when needed,
          // which is more efficient for a dynamic or long list.
          child: ListView.builder(

            // Creates 10 identical loading-placeholder rows.
            itemCount: 10,

            // itemBuilder runs for indexes 0 through 9.
            // The index is not used in the design, so every row looks the same.
            itemBuilder: (context, index){

              // Shimmer.fromColors applies an animated moving highlight
              // over the visible shapes inside its child.
              return Shimmer.fromColors(

                // baseColor is the normal background color
                // visible across most of the loading placeholder.
                baseColor: Colors.grey.shade300,

                // highlightColor is the brighter moving color
                // that creates the animated shine effect.
                highlightColor: Colors.grey.shade500,

                // The widgets inside child define the shapes of the placeholder.
                // Their own solid colors mainly make them visible/opaque masks.
                // The final animated colors come from baseColor and highlightColor.
                child: ListTile(

                  // Creates a circular placeholder for a profile image or avatar.
                  // radius: 25 means the circle's diameter is approximately 50.
                  leading: CircleAvatar(radius: 25, backgroundColor: Colors.black,),

                  // ListTile can give its title area a wide horizontal constraint.
                  // Align allows the inner Container to use its own requested width
                  // and keeps it positioned on the left side.
                  title: Align(
                    alignment: AlignmentGeometry.centerLeft,

                    // Creates the main title-text placeholder shape.
                    child: Container(
                      height: 16,
                      width: 500,
                      color: Colors.blue,),
                  ),
                    
                  // subtitle places another loading shape below the title.
                  subtitle: Padding(

                    // Adds an 8-pixel vertical gap between title and subtitle shapes.
                    padding: const EdgeInsets.only(top: 8.0),

                    // Keeps the smaller subtitle placeholder aligned to the left
                    // and allows its Container to request a separate width.
                    child: Align(
                      alignment: Alignment.centerLeft,

                      // Creates the smaller subtitle-text placeholder shape.
                      child: Container(
                        height: 12,
                        width: 300,
                        color: Colors.brown,),
                    ),
                  ),
                  
                ), );
            }),
        ),
    );
  }
}