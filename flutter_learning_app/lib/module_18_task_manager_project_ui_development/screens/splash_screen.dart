import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:module_09_flutter_basics/module_18_task_manager_project_ui_development/screens/login_screen.dart';
import 'package:module_09_flutter_basics/module_18_task_manager_project_ui_development/utils/asset_path.dart';
import 'package:module_09_flutter_basics/module_18_task_manager_project_ui_development/widget/screen_bg.dart' show ScreenBG;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    moveToNextScreen();
  }

  Future<void> moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

  }
  
  @override
  Widget build(BuildContext context) {
    return ScreenBG(child: Center(child: Image.asset(AssetPath.logo, width: 300, height: 300,)),);
  }
}

