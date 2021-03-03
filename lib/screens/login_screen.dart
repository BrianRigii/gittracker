import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/gitpaper2.png'),
          Text('GIT TRACKER', style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height:10),
          TextFormField(
            
          ),
          SizedBox(height: 5,),
          TextFormField()
        ],
      ),),
    );
  }
}