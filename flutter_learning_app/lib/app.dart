import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:module_09_flutter_basics/module_14_responsive_and_modern_ui/class_02_modern_ui_packages/loading_screen.dart';
import 'package:module_09_flutter_basics/module_14_responsive_and_modern_ui/class_02_modern_ui_packages/modern_ui_packages.dart';
import 'package:module_09_flutter_basics/module_14_responsive_and_modern_ui/class_03_dialogs_and_polished_ui/dialogs_and_polished_ui.dart';

// Imports the Module 16 task page so it can be registered as a named route.
import 'package:module_09_flutter_basics/module_16_local_database/class_02_data_manipulation/ui/task_home.dart';

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

   // ScreenUtilInit initializes flutter_screenutil before responsive units are used.
   // It stays above MaterialApp so every page inside the app can use
   // responsive extensions such as .w, .h, .sp, .sw, and .sh.
   return ScreenUtilInit(

    // designSize is the reference screen size used for responsive calculations.
    // It does not force the actual device screen to remain 360 × 690.
    // ScreenUtil compares the actual screen size with this reference size
    // and scales responsive values accordingly.
    designSize: Size(360, 690),

    // Helps responsive text adapt according to the available screen width.
    minTextAdapt: true,

    // Allows ScreenUtil to respond properly when the app is used
    // in split-screen or multi-window mode.
    splitScreenMode: true,

    // The builder runs after ScreenUtil receives the current screen information.
    // "_" represents an unused BuildContext parameter.
    // "child" is also provided by ScreenUtilInit but is not used in this code.
    builder: (_ , child){

      // MaterialApp is returned inside the builder so every route/page
      // can access the initialized ScreenUtil responsive values.
      return MaterialApp( // MaterialApp is used once for the whole app.
        debugShowCheckedModeBanner: false, // Removes the debug banner.
        title: "Flutter 16",

        // home sets the default first page when initialRoute is not used.
        // Here, home is commented out because initialRoute is being used.
        //home: Module13Class2(),

        // initialRoute sets which registered named route opens first
        // when the application starts.
        // Here, the app starts from the Module 16 local database task page.
        initialRoute: '/homeTask', 
        
        // routes connects route-name strings with their destination page widgets.
        // The left side contains the route name.
        // The right side returns the page that opens for that route.
        // These route names can be used with Navigator.pushNamed()
        // or Navigator.pushReplacementNamed().
        routes: {
          '/about': (context) => About(), // Opens the About page when "/about" is called.

          '/WidgetLifeCycle': (context) => WidgetLifeCycle(), // Opens the Widget Lifecycle page.

          '/Module13Class2': (context) => Module13Class2(), // Opens the Module 13 navigation page.

          '/test': (context) => Test(), // Opens the Test page when "/test" is called.

          "/module13Class3": (context) => Module13Class3(), // Opens the TabBar and TabBarView practice page.

          "/bottomNav": (context) => BottomNav(), // Opens the Bottom NavigationBar practice page.

          "/todoApp": (context) => TodoApp(), // Opens the Todo App practice page.
          
          "/module14Class2": (context) => Module14Class2(), // Opens the responsive and modern UI packages practice page.
          
          "/module14Class2loading": (context) => Module14Class2Loading(), // Opens the Shimmer loading-screen practice page.
          
          "/module14Class3": (context) => Module14Class3(), // Opens the Module 14 Class 3 dialogs and bottom-sheet practice page.
          
          // Registers the Module 16 task page with the "/homeTask" route name.
          // When this route is opened, Flutter creates and displays HomeTask.
          "/homeTask": (context) => HomeTask(),  
        },
        
      ); // MaterialApp controls the overall app configuration and UI.

    }
   );
  }
}