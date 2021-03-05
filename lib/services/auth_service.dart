import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_tracker/api/api.dart';
import 'package:git_tracker/data/models/issueModel.dart';
import 'package:git_tracker/data/models/user.dart';
import 'package:git_tracker/dialogs/toast.dart';

class AuthService extends ChangeNotifier {
  String _token;
  LoggedUser user;
  List<IssuesModel> issues = [];

  String get token => _token;
  bool get isLoggedIn => false;

  bool _isGettingIssues = false;
  bool get isGettingIssues => _isGettingIssues;

  set gettingIssues(bool val) {
    _isGettingIssues = val;
    notifyListeners();
  }

  setToken(String token) {
    _token = token;
    notifyListeners();
  }

  Future login() {
    return api.login().then((response) {
      var payload = response.data;
      user = LoggedUser(payload['name'], payload['location']);
    });
  }

  Future getIssues() {
    gettingIssues = true;
    issues = [];
    return api.getIssues().then((response) {
      var payload = response.data;
      payload.forEach((issue) {
        issues.add(IssuesModel.fromMap(issue));
      });
      gettingIssues = false;
    }).catchError((error) {
      print('error occured while loading issues $error');

      showToast('Something broke');
      gettingIssues = false;
    });
  }
}

var authService = AuthService();
