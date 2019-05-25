import 'package:flutter_struct/utils/request.dart';
class Home {
  static config() {
    return req.api('get', '/homes/config', {});
  }
}