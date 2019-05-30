import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';

import 'package:flutter_struct/config/app.dart';
import 'package:flutter_struct/utils/common.dart';

Request req = new Request();

class Request {
  Dio dioHttp;
  /* static Request req = new Request(); */
  // 静态变量 实例化自己的构造函数
  static final Request _instance = new Request._internal();
  // 工厂函数：如果一个构造函数并不总是返回一个新的对象，则使用 factory 来定义 这个构造函数
  factory Request() => _instance;
  // 命名构造函数
  Request._internal() {
    if (null == dioHttp) {
      dioHttp = new Dio(new BaseOptions(
        baseUrl: AppConfig.apiUrl,
        receiveTimeout: 1000 * 10, // 10秒
        connectTimeout: 5000, // 5秒
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
      ));
      dioHttp.interceptors.add(LogInterceptor(responseBody: true)); //开启请求日志
    }
  }
  // 统一请求 get post delete
  Future api(String method, String path, Map<String, dynamic> params) async {
    Response response;
    try {
      params = await this.getData(path, params);
      method = method.toLowerCase();
      switch (method) {
        case 'post':
          response = await dioHttp.post(path, data: params);
          break;
        case 'get':
          response = await dioHttp.get(path, queryParameters: params);
          break;
        case 'delete':
          response = await dioHttp.delete(path, queryParameters: params);
          break;
        default:
      }
      /* response = await dioHttp.request(path,
          data: params, options: Options(method: method));*/
      var resData = response.data;
      if (resData['code'] == 0) {
        return resData['data'];
      } else {
        // 报错
      }
    } catch (e) {
      // 报错
      throw e;
    }
  }

  // 数据统一签名
  Future<Map<String, dynamic>> getData(
      String path, Map<String, dynamic> params) async {
    // 是否登录
    bool isLogin = false;
    String secrecOrToken = '';
    if (isLogin) {
      params['appuser'] = 'user';
      secrecOrToken = 'token';
    } else {
      params['appkey'] = AppConfig.appkey;
      secrecOrToken = AppConfig.secret;
    }
    params['appkey'] = AppConfig.appkey;
    // 随机数生成
    /* Random random = new Random(10000);
    double randomNum = random.nextDouble(); */
    params['random'] = 'sss';
    // 获取macaddr
    params['macaddr'] = await getMacAddr();

    params['timestamp'] = new DateTime.now().millisecondsSinceEpoch ~/ 1000;
    params['sign'] = this.signData(path, params, secrecOrToken);
    print('request data is:\n $params');
    return params;
  }

  String signData(
      String path, Map<String, dynamic> params, String secrecOrToken) {
    String signStr = '';
    // 根据key排序
    List keys = params.keys.toList();
    keys.sort();
    // 根据key排序后的params ‘key=value’
    List<String> sortParams = [];
    keys.forEach((k) {
      sortParams.add(k + '=' + params[k].toString());
      print('$sortParams');
    });
    // 拼接签名字符串为（path + sortParams + secretOrToken）并转换sortParams为 '&key=value'
    signStr = path + sortParams.join('&') + secrecOrToken;

    // md5加密
    signStr = md5Str(signStr);
    print('sign data is:\n $signStr');
    return signStr;
  }
}
