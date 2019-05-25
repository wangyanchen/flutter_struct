import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';

// 获取mac地址
Future<String> getMacAddr() async {
  DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    
    return androidInfo.androidId;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.identifierForVendor;
  } else {
    return '其他设备暂不支持';
  }
}

// md5加密
String md5Str(String str) {
  var content = new Utf8Encoder().convert(str);
  var digest = md5.convert(content);
  return digest.toString();
}
