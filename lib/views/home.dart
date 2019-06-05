import 'package:flutter/material.dart';

import 'package:flutter_struct/components/home_head.dart';
import 'package:flutter_struct/controllers/home_controller.dart';
import 'package:flutter_struct/models/category.dart';
import 'package:flutter_struct/models/category_list.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<CategoryModel> _categoryList = [];
  List<Widget> tabs = [
    Tab(
      child: Text('首页', textAlign: TextAlign.left),
    ),
    Tab(
      text: '分类1',
    ),
    Tab(
      text: '分类2',
    ),
    Tab(
      text: '分类3',
    ),
    Tab(
      text: '分类4',
    ),
    Tab(
      text: '分类5',
    ),
    Tab(
      text: '分类6',
    ),
  ];

  List<Widget> tabView = [
    new Center(
      child: Text('首页'),
    ),
    new Center(
      child: Text('分类1'),
    ),
    new Center(
      child: Text('分类2'),
    ),
    new Center(
      child: Text('分类3'),
    ),
    new Center(
      child: Text('分类4'),
    ),
    new Center(
      child: Text('分类5'),
    ),
    new Center(
      child: Text('分类6'),
    )
  ];
  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(initialIndex: 0, length: tabs.length, vsync: this);
    homeCon.init();
    // List<CategoryModel> list = HomeCon.categoryList();
    print(_categoryList);
    _categoryList = homeCon.categoryList;
    print(_categoryList.length);
    for (var item in _categoryList) {
      print(item);
      print('---------------');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('home');
    return Container(
        child: Scaffold(
            appBar: PreferredSize(
              child: HomeHead(tabs: tabs, tabController: _tabController),
              preferredSize: Size(0, 90),
            ),
            body: TabBarView(
              children: tabView,
              controller: _tabController,
            )));
  }
}
