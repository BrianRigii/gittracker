import 'package:flutter/material.dart';
import 'package:git_tracker/routes.dart';
import 'package:git_tracker/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: authService)],
        child: MaterialApp(
          title: 'Git Tracker',
          routes: routes,
          theme: ThemeData(
              canvasColor: Colors.white,
              primaryColor: Color.fromRGBO(3, 19, 47, 1)),
          initialRoute: RouteConfig.splash,
        ));
  }
}
