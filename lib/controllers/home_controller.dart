import 'dart:async';
import 'package:flutter_struct/models/category.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_struct/models/category_list.dart';

final HomeCon homeCon = new HomeCon();

class HomeCon extends ControllerMVC {
  final categoryListModel = new CategoryListModel();
  factory HomeCon() {
    if (_this == null) _this = HomeCon._();
    return _this;
  }
  static HomeCon _this;
  // 命名构造函数，可以初始化一些东西
  HomeCon._();

  void init() {
    loadData();
  }
  Future loadData() async {
    print('load Data');
    categoryListModel.getList();
    refresh();
    return;
  }
  static List<CategoryModel> categoryList() {
    return CategoryListModel.categorys;
  } 
}