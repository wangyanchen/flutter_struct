import 'package:flutter_struct/utils/request.dart';
class Activity {
  static list (Map<String, dynamic> params) {
    return req.api('get', '/activitys', params);
  }
}