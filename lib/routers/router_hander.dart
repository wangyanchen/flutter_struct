import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_struct/views/index.dart';

var indexHander = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Index();
  }
);