import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_13_stateful_widgets_and_navigation/class_02_navigation/pages/test.dart';
import 'package:module_09_flutter_basics/module_18_task_manager_project_ui_development/widget/screen_bg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Column(
        children: [
        SizedBox(height: 150,),
        Text("Get Started With",
        style: Theme.of(context).textTheme.titleLarge,
        ),

        SizedBox(height: 25,),

        TextFormField(
          decoration: InputDecoration(
            hintText: "Email",    
          ),
        ),

        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Passward",    
          ),
        ),


        FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined)),

        SizedBox(height: 35,),
        Column(
          children: [
            TextButton(onPressed: (){}, child: Text("Forget password ? ", style: TextStyle(color: Colors.grey),)),
            
          ],
        )

        ],
      )),
    );
  }
}