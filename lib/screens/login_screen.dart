import 'package:flutter/material.dart';
import 'package:git_tracker/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/gitpaper2.png',
              height: 100,
            ),
            Text(
              'GIT TRACKER',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  labelText: 'Email'),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  labelText: 'Password'),
            ),
            SizedBox(height:10),
            FlatButton(onPressed: (){
              Navigator.pushReplacementNamed(context, RouteConfig.homescreen);
            }, child: Text('LOGIN',style: TextStyle(fontWeight: FontWeight.bold),),minWidth: 400, color: Theme.of(context).primaryColor, textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}
