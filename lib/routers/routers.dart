import 'package:fluro/fluro.dart';
import 'router_hander.dart';
class Routes {
  static String index = '/';
  static void configureRoutes(Router router) {
    router.define(index, handler: indexHander);
  }
}