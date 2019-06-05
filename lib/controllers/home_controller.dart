import 'dart:async';
import 'package:flutter_struct/models/category.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_struct/models/category_list.dart';

class HomeCon extends ControllerMVC {
  final categoryListModel = new CategoryListModel();
  List<CategoryModel> categoryList = [];
  factory HomeCon() {
    if (_this == null) _this = HomeCon._();
    return _this;
  }
  static HomeCon _this;
  // 命名构造函数，可以初始化一些东西
  HomeCon._();

  static HomeCon get con => _this;

  void init() {
    loadData();
  }
  Future loadData() async {
    // print('load Data');
    categoryListModel.getList().then((res) {
      categoryList = res;
      refresh();
    });
    return;
  }
}
