import 'package:flutter/material.dart';

import 'package:flutter_struct/components/home_head.dart';
import 'package:flutter_struct/controllers/home_controller.dart';
import 'package:flutter_struct/models/category.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends StateMVC<HomeView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  _HomeViewState() : super(HomeCon()) {
    homeCon = HomeCon.con;
  }
 
  HomeCon homeCon;
  TabController _tabController;
  List<CategoryModel> _categoryList = []; // 分类列表
  List<Widget> tabs = []; // tab标题
  List<Widget> tabView = []; // tabView
  @override
  void initState() {
    super.initState();
    homeCon.init();
    // List<CategoryModel> list = HomeCon.categoryList();
  }
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    print('ssss');
    super.build(context);
     _categoryList = homeCon.categoryList;
    tabs = [];
    tabView = [];
    for (var item in _categoryList) {
      // print(item.name);
      tabs.add(Tab(text: item.name,));
      tabView.add(
        new Center(
          child: Text(item.name),
        )
      );
    }
    _tabController =
        new TabController(initialIndex: 0, length: tabs.length, vsync: this);
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
  @override
  bool get wantKeepAlive => true;
}
