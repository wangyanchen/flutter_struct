import 'dart:io';

class AppConfig {
  // api地址
  static String apiUrl = 'https://api.chayuan.info:1443';
  // 图片地址
  static String imgUrl = 'http://img.chayuan.info/';
  // apkey
  static String appkey = Platform.isIOS ? 'ios_consumer' : 'android_consumer';
  // secret
  static String secret = Platform.isIOS ? 'gw9gtsdsf3' : 'gw9gtsdsf2';
  // 常用正则
  final Map<String, String> regex = {
    'mobile': r'/^1[3|4|5|6|7|8|9][0-9]\d{8}$/',
    'name': r'/^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$/'
  };
}
