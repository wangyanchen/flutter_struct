import 'package:flutter_struct/utils/request.dart';
class Commodity {
  static list(Map<String, dynamic> params) {
    return req.api('get', '/commoditys', params);
  }
}