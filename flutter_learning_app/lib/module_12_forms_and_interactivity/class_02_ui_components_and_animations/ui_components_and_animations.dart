import 'package:flutter/material.dart';

// StatefulWidget is used when the UI needs to change after user action.
// Here, animation size, opacity, and alignment change after tapping.
class Module12Class2 extends StatefulWidget {
  const Module12Class2({super.key});

  @override
  State<Module12Class2> createState() => _MyWidgetState();
}

// State class stores changeable data for Module12Class2.
// When data changes, setState() rebuilds the UI.
class _MyWidgetState extends State<Module12Class2> {
  bool isExpanded = false; // Controls the animation state: false = normal, true = changed/expanded.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basic animation",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stepper shows a step-by-step process UI.
            // Each Step represents one stage of the process.
            // Stepper(steps: [
            //   Step(title: Text("Address"), content: TextField(
            //     decoration: InputDecoration(
            //       hintText: "Enter Address"
            //     ),
            //   )),            
              
            //   Step(title: Text("Payment"), content: TextField(
            //     decoration: InputDecoration(
            //       hintText: "Select payment method"
            //     ),
            //   )),
            //   Step(title: Text("Confirm"), content: TextField(
            //     decoration: InputDecoration(
            //       hintText: "Review and place order"
            //     ),
            //   )),
        
            //   ]),
        
            Stepper(
              connectorColor:WidgetStateProperty.all(Colors.blue), // Gives the same connector line color for all Stepper states.
              currentStep: 1, // Makes the second step active because index starts from 0.
              steps: [
              Step(title: Text("Place Order"), content: SizedBox()), // Creates one step with title and empty content.
              Step(title: Text("Order Confirm"), content: SizedBox()),
              Step(title: Text("Processing"), content: SizedBox()),
              Step(title: Text("Delivered"), content: SizedBox()),
               
              ]),
        
            InkWell(
              onTap: (){
                // setState tells Flutter that data changed.
                // After setState, Flutter rebuilds the UI with the new value.
                setState(() {
                  isExpanded = !isExpanded; // Reverses the bool value: true becomes false, false becomes true.
                });
              },

              // AnimatedContainer automatically animates property changes.
              // Here, height changes smoothly because it depends on isExpanded.
              child: AnimatedContainer(duration: Duration(seconds: 1),
                width: 250,
                height: isExpanded ? 250 :150, // If isExpanded is true height is 250, otherwise 150.
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              
              ),
            ),
              
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                setState(() {
                  isExpanded = !isExpanded; // Reverses the same bool value again on tap.
                });
              },
              child: Container( // Normal Container changes size instantly; it does not animate.
                width: 250,
                height: isExpanded ? 250 :150, // Same height condition, but the change happens instantly.
                decoration: BoxDecoration(
                  color: Colors.red
                ),
              
              ),
            ),

            // AnimatedOpacity smoothly changes widget visibility.
            AnimatedOpacity(
              opacity: isExpanded ? 1 : 0, // 1 means fully visible, 0 means fully invisible.
              duration: Duration(seconds: 2), // Controls how long the opacity animation takes.
              child: Card(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hello", style: TextStyle(
                    fontSize: 25
                  ),),
                ),
              ),
              ),
               
              // TweenAnimationBuilder animates a value from begin to end.
              // It is useful for number animation, progress animation, size animation, etc.
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0 , end: 999), // Animates a double value from 0 to 999.
                duration: Duration(seconds: 5), // The animation takes 5 seconds.
                builder: (context, value, child){ // builder rebuilds while the animated value changes.
                  return Text("৳ ${value.toInt()}", // Converts the animated double value to int before showing.
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                  ),);
                }
                ),

                 Padding(
                padding: const EdgeInsets.all(20),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0 , end: 0.56), // 0.56 means 56% progress.
                  duration: Duration(seconds: 5), 
                  builder: (context, value, child){
                    return LinearProgressIndicator(
                      value: value, // Uses the animated value to fill the progress bar.
                      minHeight: 10,
                    );
                  }
                  ),
                ),

                // AnimatedAlign smoothly changes the child's position.
                AnimatedAlign(
                  alignment: isExpanded ? Alignment.center : Alignment.topLeft, // Moves to center when true, top-left when false.
                  duration: Duration(seconds: 3), // The alignment movement takes 3 seconds.
                  child: Image.network(
                    "https://t3.ftcdn.net/jpg/05/83/04/44/360_F_583044458_ZOx8uOu2pXLvXRGwJYG0JyR6nlG405Uc.jpg",
                     height: 50,)
                  
                  ),
          ],
        ),
      )
    );
  }
}