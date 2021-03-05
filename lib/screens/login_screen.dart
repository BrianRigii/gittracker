import 'package:flutter/material.dart';
import 'package:git_tracker/routes.dart';
import 'package:git_tracker/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController tokenController = TextEditingController();

  void login() {
    authService.login().then((value) =>
        Navigator.pushReplacementNamed(context, RouteConfig.homescreen));
  }

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
              height: 150,
            ),
            Text(
              'GIT TRACKER',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: tokenController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  labelText: 'Personal Access Token'),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(height: 10),
            FlatButton(
              onPressed: () async {
                await authService.setToken(tokenController.text);
                login();
              },
              child: Text(
                'LOGIN',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              minWidth: 400,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
