import 'package:flutter/material.dart';
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
    return MaterialApp(// MaterialApp is used once for the whole app.
      debugShowCheckedModeBanner: false, // remove debug mark 
      title: "Flutter 16",
      home: Class03(), // The page that opens when the app starts is set in 'home:'.
    ); // MaterialApp() controls the overall app UI.

  }
}