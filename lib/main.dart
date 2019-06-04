import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:flutter_struct/routers/application.dart';
import 'package:flutter_struct/routers/routers.dart';
import 'package:flutter_struct/views/index.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends AppMVC {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  _initData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 用户登录数据、
    final String userData = prefs.getString('f-user') ?? '';
    if (userData != '') {
      print(userData);
      // store.dispatch();
    } else {
      print('empty user data');
      // 去登录页
    }

    // prefs.getKeys()
  }

  showPage() {
    // 初始化本地存储信息到redux，方便redux直接获取
    _initData();
    return Index(
        // onInt: () => {}
        );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'Flutter Demo1',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: showPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
