import 'package:git_tracker/config.dart';

import 'dio _api.dart';

class Api extends DioApi {
  Api() : super(Config.apiUrl);

  Future login() {
    return dio.get('/user');
  }

  Future getIssues() {
    return dio.get('/issues', queryParameters: {'filter': 'all'});
  }
}

var api = Api();
