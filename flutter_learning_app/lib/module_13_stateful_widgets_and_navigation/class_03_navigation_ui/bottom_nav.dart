import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_02_lists_and_list_items/lists_and_list_items.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_03_ui_components/grid_view_practice.dart';
import 'package:module_09_flutter_basics/module_12_forms_and_interactivity/class_01_form_elements/form_elements.dart';
import 'package:module_09_flutter_basics/module_12_forms_and_interactivity/class_02_ui_components_and_animations/ui_components_and_animations.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_03_navigation_ui/navigation_ui.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  
  // selectedIndex stores the currently selected bottom navigation item index.
  // 0 means Home tab, 1 means Inbox tab, 2 means Search tab, and 3 means Profile tab.
  int selectedIndex = 0;

  // This list stores the screens/pages that will be shown in the body.
  // The selectedIndex value selects a screen from this list.
  // Example: selectedIndex = 0 means screens[0] will show.
  // Example: selectedIndex = 2 means screens[2] will show.
  List<Widget> screens = [
    Module13Class3(), // screens[0] -> shows the Module13Class3 page when Home tab is selected, while the Bottom NavigationBar stays visible.
    Module11Class3(), // screens[1] -> shows this page when Inbox tab is selected.
    Module12Class1(), // screens[2] -> shows this page when Search tab is selected.
    Module12Class2(), // screens[3] -> shows this page when Profile tab is selected.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // The body shows one screen from the screens list.
      // Which screen will show depends on selectedIndex.
      body: screens[selectedIndex],

      // NavigationBar creates the bottom navigation menu.
      // It is used to switch between different main sections/pages of the app.
      bottomNavigationBar: NavigationBar(

        // selectedIndex tells NavigationBar which destination is currently active.
        // This keeps the selected bottom navigation item highlighted.
        selectedIndex: selectedIndex,

        // onDestinationSelected runs when the user taps a bottom navigation item.
        // Flutter automatically gives the tapped item's index.
        // Example: Home tap -> index 0, Inbox tap -> index 1.
        onDestinationSelected: (int index) {
          
          // setState updates selectedIndex and rebuilds the UI.
          // After rebuild, body: screens[selectedIndex] shows the newly selected screen.
          setState(() {
            selectedIndex = index;
    
          });
        },

        // destinations are the clickable items of the NavigationBar.
        // NavigationBar needs NavigationDestination widgets as its items.
        // Each NavigationDestination represents one bottom navigation item.
        // It usually has an icon and a label.
        // The order of destinations must match the order of screens list.
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home), // Icon shown for the Home destination.
            label: "Home", // Text label shown under the icon.
          ), // index 0 -> opens screens[0] -> Module13Class3()

          NavigationDestination(
            icon: Icon(Icons.message), // Icon shown for the Inbox destination.
            label: "Inbox", // Text label shown under the icon.
          ), // index 1 -> opens screens[1] -> Module11Class3()

          NavigationDestination(
            icon: Icon(Icons.search), // Icon shown for the Search destination.
            label: "Search", // Text label shown under the icon.
          ), // index 2 -> opens screens[2] -> Module12Class1()

          NavigationDestination(
            icon: Icon(Icons.person), // Icon shown for the Profile destination.
            label: "Profile", // Text label shown under the icon.
          ), // index 3 -> opens screens[3] -> Module12Class2()
        ],
      ),

    );
  }
}