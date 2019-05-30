import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_struct/components/home_head.dart';

import 'package:flutter_struct/models/models.dart';
import 'package:flutter_struct/redux/actions/actions.dart';

import 'package:flutter_struct/views/my.dart';
import 'package:flutter_struct/views/search.dart';

import 'home.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> page_view_list2 = [HomeView(), SearchView(), MyView()];
  @override

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    // print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
    // print('设备高度:${ScreenUtil.screenHeight}'); //Device height
    // print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
    // print(
    //     '底部安全区距离:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    // print(
    //     '状态栏高度:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px

    // print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
    // print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');

    // print(
    //     '宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    // print(
    //     '高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');
    // print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');

    return new StoreConnector<AppState, GlobalModel>(
      converter: (store) {
        return new GlobalModel(
          state: store.state,
          setIndex: (index) => store.dispatch(SelectTabAction(index)),
        );
      },
      builder: (BuildContext context, GlobalModel vm) {
        return Scaffold(
            appBar: PreferredSize(
              child: HomeHead(),
              preferredSize: Size(0, 60),
            ),
            body: page_view_list2[vm.state.activeTab],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('home'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), title: Text('search')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), title: Text('my'))
              ],
              currentIndex: vm.state.activeTab,
              onTap: vm.setIndex,
            ));
      },
    );
  }
}

class GlobalModel {
  final AppState state;
  final void Function(int index ) setIndex;
  GlobalModel({ this.state, this.setIndex});
}
