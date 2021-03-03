
import 'package:git_tracker/screens/home_screen.dart';
import 'package:git_tracker/screens/login_screen.dart';
import 'package:git_tracker/screens/splash_screen.dart';

class RouteConfig {
  static final splash = '/';
  static final login = '/login';
  static final homescreen = '/home';
}

var routes = {
  RouteConfig.splash: (context) => SplashScreen(),
  RouteConfig.login: (context)=> LoginScreen(),
  RouteConfig.homescreen : (context)=>HomeScreen()
};
