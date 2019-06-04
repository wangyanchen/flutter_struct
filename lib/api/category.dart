import 'package:flutter_struct/utils/request.dart';
class CategoryApi {
  static list(Map<String, dynamic> params) {
    return req.api('get', '/categorys', params);
  }
}