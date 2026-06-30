import 'package:flutter/material.dart';

class Class1 extends StatelessWidget {
  const Class1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Dark", style: TextStyle(color: Colors.brown.shade800, fontWeight: FontWeight.bold, fontSize: 28),),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // padding: EdgeInsets.all(10),
            // margin: EdgeInsets.all(50),
            alignment: Alignment.center,
            height: 100,
            width: 100,
            transform: Matrix4.rotationZ(0.3),// make the container curve
            decoration: BoxDecoration(  // To design is container
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(12), // change corner bordershape (value x-x)
              border: Border.all(width: 3,color: Colors.red),
              boxShadow: [
                BoxShadow( // create object Shadow
                  color: Colors.black12,
                  offset: Offset(10, 10), // shadow position X and y axis
                  blurRadius: 4) // To blour the shadow 
              ]
              ),
            child: Text("Hi",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          ),

          SizedBox( // gap between two container
            height: 10,
          ),

          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                )
              ]
            ),
            child: Row(
              children: [
                CircleAvatar(radius: 30,
                backgroundImage: NetworkImage("https://scdn.speedsize.com/653debbb-d4a4-43dc-aac9-c44f9620f59a/https://snibbs.co/cdn/shop/articles/What_are_the_Challenges_of_Being_a_Doctor.jpg?v=1684314843"),), // create a avater
                SizedBox(width: 12,), // horizontal gap between avatar and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // for all text from start
                  children: [
                    Text("Dr.Hossain", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("dermatologist")]
                ),
                
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              Container( // this container comer uper of its pervious container 
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                ),
              ),
              Positioned( // for set in a specific posiition in a contatiner
                top: 10,
                right: 10,
                child: Container( // this container comer uper of its pervious container 
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
    );
  }
}
