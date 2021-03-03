import 'package:flutter/material.dart';
import 'package:git_tracker/routes.dart';
import 'package:git_tracker/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

   navigate() async{
     await Future.delayed(Duration(seconds: 1));
    if (authService.isLoggedIn) {
      Navigator.pushReplacementNamed(context, RouteConfig.homescreen);
      return;
    } else {
      Navigator.pushReplacementNamed(context, RouteConfig.login);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
