import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_01_text_and_images/text_and_images.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_02_lists_and_list_items/lists_and_list_items.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_03_ui_components/custom_widgets.dart';
import 'package:module_09_flutter_basics/module_11_advanced_widgets/class_03_ui_components/grid_view_practice.dart';

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
      home: CustomW(), // The page that opens when the app starts is set in 'home:'.
    ); // MaterialApp() controls the overall app UI.

  }
}