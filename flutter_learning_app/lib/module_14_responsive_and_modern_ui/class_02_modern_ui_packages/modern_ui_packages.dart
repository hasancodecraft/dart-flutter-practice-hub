import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Module14Class2 extends StatefulWidget {
  const Module14Class2({super.key});

  @override
  State<Module14Class2> createState() => _Module14Class2State();
}

class _Module14Class2State extends State<Module14Class2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Package manager website: pub.dev

        // Packages used to make UI responsive:
        // flutter_screenutil -> height: .h, width: .w, text size: .sp
        // sizer -> another package that can also be used for responsive UI
        
        // Package used for different and uneven grid layouts:
        // flutter_staggered_grid_view

        // Before using a package, check its:
        // downloads, pub points, likes, documentation, and recent updates.

        // SingleChildScrollView makes the entire Column scroll together.
        // Containers, texts, StaggeredGrid, and MasonryGridView will all
        // move together when the outer page is scrolled.
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                      // This Container uses normal fixed values.
                      // Its size remains 200 × 200 without ScreenUtil scaling.
                      Container(
                         height: 200,
                         width: 200,
                         color: Colors.red, 
                      ),
          
                      SizedBox(height: 15,),
          
                      // .h scales height according to the actual screen height.
                      // .w scales width according to the actual screen width.
                      // Since height and width use different scaling directions,
                      // this Container may not remain a perfect square on every screen.
                      Container(
                         height: 180.h,
                         width: 180.w,
                         color: Colors.green, 
                      ),
          
                      SizedBox(height: 15,),
          
                      // .sh means a fraction of the current full screen height.
                      // .sw means a fraction of the current full screen width.
                      // 0.2.sh = 20% of screen height.
                      // 0.2.sw = 20% of screen width.
                      Container(
                         height: 0.2.sh,
                         width: 0.2.sw,
                         color: Colors.pink, 
                      ),
          
                      SizedBox(height: 15,),
          
                      // Both height and width use the same .w value.
                      // Therefore, both final values remain equal and create
                      // a responsive square based on screen width.
                      Container(
                         height: 50.w,
                         width: 50.w,
                         color: Colors.yellow, 
                      ),
          
                      // This text uses a normal fixed font size.
                      Text("Hello without responsive", style: TextStyle(fontSize: 25),),

                      // .sp makes the font size responsive according to ScreenUtil.
                      Text("Hello with responsive", style: TextStyle(fontSize: 25.sp),),
          
                      // StaggeredGrid creates a grid where different tiles
                      // can occupy different numbers of columns and rows.
                      // Unlike a normal GridView, every tile does not have to be the same size.
                      //
                      // StaggeredGrid itself is placed inside the outer
                      // SingleChildScrollView, so the outer page handles scrolling.
                      StaggeredGrid.count(

                        // Divides the available horizontal width into 4 equal grid cells.
                        crossAxisCount: 4,

                        // Adds vertical spacing between grid tiles.
                        mainAxisSpacing: 4,

                        // Adds horizontal spacing between grid tiles.
                        crossAxisSpacing: 4,

                        children: [

                          // First tile:
                          // crossAxisCellCount: 2 -> takes 2 of the 4 columns.
                          // mainAxisCellCount: 2 -> takes 2 grid rows in height.
                          // Its grid size is therefore 2 × 2.
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrZRx1Bel7uoyG5c7-HZ5to2umFtifFqC2OTT9O18o0g&s=10"),
                                  Text("Image"),
                                ],
                              ),
                            )
                         
                          ),

                          // Second tile:
                          // Takes 2 columns in width but only 1 row in height.
                          // Its grid size is 2 × 1.
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 1,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrZRx1Bel7uoyG5c7-HZ5to2umFtifFqC2OTT9O18o0g&s=10"),
                                  Text("Image"),
                                ],
                              ),
                            )
                         
                          ),

                          // Third tile:
                          // Takes 1 column and 1 row, so its grid size is 1 × 1.
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrZRx1Bel7uoyG5c7-HZ5to2umFtifFqC2OTT9O18o0g&s=10"),
                                  Text("Image"),
                                ],
                              ),
                            )
                         
                          ),

                          // Fourth tile:
                          // It is another 1 × 1 tile and can sit beside
                          // the previous 1 × 1 tile when space is available.
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrZRx1Bel7uoyG5c7-HZ5to2umFtifFqC2OTT9O18o0g&s=10"),
                                  Text("Image"),
                                ],
                              ),
                            )
                         
                          ),

                          // Fifth tile:
                          // Takes all 4 columns, so it uses the full grid width.
                          // It also takes 2 rows in height, making it a 4 × 2 tile.
                          StaggeredGridTile.count(
                            crossAxisCellCount: 4,
                            mainAxisCellCount: 2,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrZRx1Bel7uoyG5c7-HZ5to2umFtifFqC2OTT9O18o0g&s=10"),
                                  Text("Image"),
                                ],
                              ),
                            )
                         
                          ),
                        ],
                      ),
          
                      // MasonryGridView creates a masonry-style grid.
                      // Each item can keep its own natural height instead of
                      // being forced to match every other item's height.
                      //
                      // MasonryGridView.count is scrollable by default.
                      // However, it is currently inside an outer SingleChildScrollView.
                      // If both widgets scroll independently, nested-scroll conflict
                      // and layout problems can occur.
                      MasonryGridView.count(

                        // Makes MasonryGridView take only the total height
                        // required by all of its items.
                        //
                        // This is necessary because it is inside a Column
                        // and the outer SingleChildScrollView needs to know
                        // the full height of the grid.
                        shrinkWrap: true,

                        // Disables MasonryGridView's own default scrolling.
                        // The outer SingleChildScrollView will control
                        // scrolling for the entire page.
                        physics: NeverScrollableScrollPhysics(),

                        // Divides the MasonryGridView into 3 vertical columns.
                        crossAxisCount: 3, 

                        // itemBuilder will create a total of 20 grid items.
                        itemCount: 20,

                        // itemBuilder runs once for every index from 0 to 19.
                        // Since index is not used inside the returned Card,
                        // all 20 items currently show the same image and text.
                        itemBuilder: (context, index){
                          return Card(
                            child: Column(
                              children: [
                                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_7_9PBBm-a1oiirgGtWouNlvJyp59vUc7ldVnBB1KydY7dIxtjomBfME&s=10"),
                                Text("Image"),
                              ],
                              
                            ),
                          );
                        })
                                        ],
              ),
            ),
          ),
        ),
    );
  }
}