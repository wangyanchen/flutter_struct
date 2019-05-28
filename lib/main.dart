import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_struct/routers/application.dart';
import 'package:flutter_struct/routers/routers.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_struct/views/index.dart';
import 'package:flutter_struct/redux/global.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = new Store<GlobalState>(globalReducer,
  initialState: GlobalState.initial());
  runApp(new MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<GlobalState> store;
  MyApp({this.store}) {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  showPage() {
    return Index();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return new StoreProvider<GlobalState> (
      store: store,
      child: MaterialApp(
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
        home:  showPage(),
        onGenerateRoute: Application.router.generator,
      )
    );
  }
}
