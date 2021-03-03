import 'package:flutter/material.dart';
import 'package:git_tracker/routes.dart';

void main() {
  runApp(MyApp());
}
 
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Git Tracker',
       theme: ThemeData(canvasColor: Colors.white),
       initialRoute: RouteConfig.splash,
       
     );
   }
 }
