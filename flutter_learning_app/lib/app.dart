import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_01_text_and_images/text_and_images.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_02_lists_and_list_items/lists_and_list_items.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_03_ui_components/custom_widgets.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_03_ui_components/grid_view_practice.dart';
import 'package:module_09_flutter_basics/module_12_forms_and_interactivity/class_01_form_elements/form_elements.dart';
import 'package:module_09_flutter_basics/module_12_forms_and_interactivity/class_02_ui_components_and_animations/ui_components_and_animations.dart';
import 'package:module_09_flutter_basics/module_12_forms_and_interactivity/class_03_touch_and_gestures/touch_and_gestures.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_01_widget_lifecycle/widget_lifecycle.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_02_navigation/navigation.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_02_navigation/pages/about.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_02_navigation/pages/test.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_03_navigation_ui/bottom_nav.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_03_navigation_ui/navigation_ui.dart';
import 'package:module_09_flutter_basics/module_14_responsive_and_modern_ui/class_01_todo_app_practice/todo_app.dart';

import 'module_09_flutter_basics/class_02_basic_widgets/home.dart';
import 'module_09_flutter_basics/class_03_app_structure/app_structure.dart';

import 'module_10_core_widgets_and_layouts/class_01_core_layouts_and_stack/core_layouts_and_stack.dart';
import 'module_10_core_widgets_and_layouts/class_02_alignment_and_decoration/alignment_and_decoration.dart';
import 'module_10_core_widgets_and_layouts/class_03_responsive_text_and_media_query/responsive_text_and_media_query.dart';

// Stateless -> Unchangeable
// Stateful -> Changeable/dynamic
class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override // Overrides the build method.
  Widget build(BuildContext context) { // context tells us about the page's position.
    return MaterialApp( // MaterialApp is used once for the whole app.
      debugShowCheckedModeBanner: false, // Removes the debug banner.
      title: "Flutter 16",

      // home is the default first page when initialRoute is not used.
      // But here initialRoute is used, so the app will start from initialRoute instead.
      //home: Module13Class2(),

      // initialRoute sets which named route/page opens first when the app starts.
      // Here, the app starts from the "/todoApp" route.
      initialRoute: '/todoApp', 
      
      // routes is a map of route names and their page widgets.
      // Left side = route name.
      // Right side = page widget that will open for that route.
      // These route names can be used with Navigator.pushNamed() or Navigator.pushReplacementNamed().
      routes: {
        '/about': (context) => About(), // Opens the About page when "/about" route is called.

        '/WidgetLifeCycle': (context) => WidgetLifeCycle(), // Opens the WidgetLifeCycle page.

        '/Module13Class2': (context) => Module13Class2(), // Opens the Module13Class2 navigation page.

        '/test': (context) => Test(), // Opens the Test page when "/test" route is called.

        "/module13Class3": (context) => Module13Class3(), // Opens the TabBar and TabBarView practice page.

        "/bottomNav": (context) => BottomNav(), // Opens the Bottom NavigationBar practice page.

        "/todoApp": (context) => TodoApp(),  // Opens the Todo App practice page.
      },
      
    ); // MaterialApp() controls the overall app UI.

  }
}