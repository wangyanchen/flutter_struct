import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_struct/style/SyIcons.dart';
class HomeHead extends StatefulWidget {
  @override
  _HomeHeadState createState() => _HomeHeadState();
}

class _HomeHeadState extends State<HomeHead> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new PreferredSize(
      child: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          titleSpacing: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                child: new Image(
                  image: AssetImage(SyIcons.Home['homeLogo']),
                  width: ScreenUtil().setWidth(52),
                  height: ScreenUtil().setHeight(52),
                ),
              ),
              new Expanded(
                flex: 1,
                child: new Container(
                    height: ScreenUtil().setHeight(55),
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(8))),
                    child: TextField(
                      cursorColor: Colors.grey, // 光标颜色
                      enabled: false,
                      // 默认设置
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 7.0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(169, 169, 169, 0.5),
                          ),
                          border: InputBorder.none,
                          hintText: "请输入关键词搜索",
                          hintStyle: new TextStyle(
                              fontSize: ScreenUtil().setSp(26),
                              color: Color.fromARGB(50, 0, 0, 0))),
                    )),
              ),
              new Image(
                image: AssetImage(SyIcons.commonMessage),
                width: ScreenUtil().setWidth(64),
                height: ScreenUtil().setHeight(64),
              ),
            ],
          ),
          elevation: 0,
       )
    );
  }
}