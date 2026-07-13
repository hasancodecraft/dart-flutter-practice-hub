import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/widget/city_card.dart';
import 'package:module_09_flutter_basics/module_12_forms_and_interactivity/class_01_form_elements/form_elements.dart';

class Module13Class3 extends StatefulWidget {
  const Module13Class3({super.key});

  @override
  State<Module13Class3> createState() => _Module13Class3State();
}

// SingleTickerProviderStateMixin gives this State class ticker/vsync support.
// TabController needs vsync to control tab animation efficiently.
class _Module13Class3State extends State<Module13Class3> with SingleTickerProviderStateMixin{

 // late means this variable will be initialized later before it is used.
 // TabController controls which tab is selected and connects TabBar with TabBarView.
 late TabController _tabController;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // TabController manages tab selection and tab animation.
    // length: 3 means there are 3 tabs.
    // vsync: this connects the controller with SingleTickerProviderStateMixin for animation performance.
    // initialIndex: 1 means the second tab will be selected first when the page opens.
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab bar"),
        backgroundColor: Colors.pink,

        // bottom is used to place TabBar under the AppBar title area.
        bottom: TabBar(

          // This controller connects this TabBar with the TabBarView below.
          controller: _tabController,

          // indicator customizes the selected tab background/indicator design.
          indicator: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
          ),

          // labelColor sets the selected tab text/icon color.
          labelColor: Colors.white,

          // unselectedLabelColor sets the text/icon color of unselected tabs.
          unselectedLabelColor: Colors.yellow,

          // indicatorPadding adds space around the selected tab indicator.
          indicatorPadding: EdgeInsets.all(2),

          // tabs are the clickable tab buttons shown inside the TabBar.
          // Number of tabs must match TabController length and TabBarView children count.
          tabs: [
            Tab(icon: Icon(Icons.home),
            text: "Home",),
          
            Tab(icon: Icon(Icons.favorite),
            text: "Favourite",),
          
            Tab(icon: Icon(Icons.settings),
            text: "Settings",),
          
          ]),
        ),

      // TabBarView shows the page/content for each selected tab.
      body: TabBarView(

        // Same controller is used here, so TabBar and TabBarView stay connected.
        controller:_tabController,

        // children are the screens/content for each tab.
        // children count must be equal to the number of tabs.
        children: [
          // Container( // match the count of tab os this is use for home tab
          //   height: 100,
          //   width: 100,
          //   color: Colors.red,
          //   child: Center(child: Text("Home")),
          // ),
        
          // Container( // match the count of tab os this is use for home tab
          //   height: 100,
          //   width: 100,
          //   color: Colors.green,
          //   child: Center(child: Text("Faviourite")),
          // ),
        
          // Container( // match the count of tab os this is use for home tab
          //   height: 100,
          //   width: 100,
          //   color: Colors.blue,
          //   child: Center(child: Text("Settings")),
          // )

        // First TabBar item shows this first TabBarView child.
        CityCard(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQSCCG3jdtIkgBXFjjnf9zoE8n7GMPw3X5DLJurHVUkttEsPRrFySoHGXc&s=10", title: "Cox's Bazar", rating: "4.8"), // Sends Cox's Bazar data to the reusable CityCard widget.
        
        // Second TabBar item shows this second TabBarView child.
        Module12Class1(),

        // Third TabBar item shows this third TabBarView child.
        Column(
          children: [
            Image.network("https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2018/10/taking-beautiful-photos-of-nature-2.jpg?resize=1500%2C1000&ssl=1"),
            Text("Custome Ui"),
          ],
        )


      
      
      ]) ,





    );
  }
}