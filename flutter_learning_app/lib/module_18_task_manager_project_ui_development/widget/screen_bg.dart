import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:module_09_flutter_basics/module_18_task_manager_project_ui_development/utils/asset_path.dart';

class ScreenBG extends StatelessWidget {
  final Widget child;
  const ScreenBG({
    super.key, required this.child });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
          AssetPath.backgroundSVG),
          
        child,
      ],
    );
  }
}