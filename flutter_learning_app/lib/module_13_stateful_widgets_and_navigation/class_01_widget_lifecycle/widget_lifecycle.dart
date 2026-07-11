import 'package:flutter/material.dart';

class WidgetLifeCycle extends StatefulWidget {
    WidgetLifeCycle({super.key})
    {
        print("1 Constructor"); // Runs first when the WidgetLifeCycle widget object is created.
    }

  @override
  State<WidgetLifeCycle> createState(){
    print("2 Create State"); // Runs after constructor and creates the State object.
    return _WidgetLifeCycleState();
  }
}

class _WidgetLifeCycleState extends State<WidgetLifeCycle> {
  
  int number =  0; // Stores the counter value.

  // initState() runs only once when this State object is created.
  // Use it for one-time setup before the UI is shown.
  // Example: initialize controller, load data, start timer, call API.
  void initState(){
    super.initState(); // Calls the parent initState method.
    print("3 Init state");
  }

  @override
  // dispose() runs when this page/widget is permanently removed.
  // Use it to clean memory/resources.
  // Example: dispose controller, cancel timer, remove listener.
  void dispose() {
    // TODO: implement dispose
    super.dispose(); // Calls the parent dispose method.
  }

  @override
  // didChangeDependencies() runs after initState().
  // It can run again if inherited things change, like Theme, MediaQuery, Provider, etc.
  // Use it when setup depends on context or inherited widgets.
  void didChangeDependencies() { 
    // TODO: implement didChangeDependencies
    super.didChangeDependencies(); // Calls the parent didChangeDependencies method.
    print("4 did");
  }

  @override
  // deactivate() runs when this State is removed from the widget tree temporarily.
  // It does not always mean final delete.
  // If the widget is permanently removed, dispose() runs after deactivate().
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate(); // Calls the parent deactivate method.
  }

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text("Counter", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.red),),
      ),

      body: Column(
        children: [
          Text(number.toString(), style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold,color: Colors.pink)), // Shows the current counter value.

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  // setState tells Flutter that state/data changed.
                  // Then Flutter runs build() again and updates the UI with the new number.
                  setState(() {
                    number++; // Increases number by 1.
                  print(number); // Prints the updated number in the debug console.
                  });
                  
                }, 
                child: Text("+",style: TextStyle(fontSize: 25, color: Colors.red),)),
         
              ElevatedButton(
                onPressed: (){
                   // setState tells Flutter that state/data changed.
                   // Then Flutter runs build() again and updates the UI with the new number.
                   setState(() {
                    number--; // Decreases number by 1.
                  print(number); // Prints the updated number in the debug console.
                  });
                }, 
                child: Text("-",style: TextStyle(fontSize: 25, color: Colors.red),)),
         
          ],)
        ],
      ),
    );
  }
}