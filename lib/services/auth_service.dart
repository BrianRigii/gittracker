import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier{

bool get isLoggedIn => false;
}

var authService = AuthService();