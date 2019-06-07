import 'package:flutter_struct/models/commodity.dart';
import 'package:flutter_struct/api/commodity.dart';
class ComodityListModel {
  static List<CommodityModel> get commoditys => _commoditys.toList();
  static List<CommodityModel>  _commoditys= [];
  Future getList() async {
    final Map<String, dynamic> params = {
      'limit': 100,
      'fields': 'id,icon,image,name,status,parentid'
    };
    return CommodityApi.list(params).then((res) {
      List data = res['data'];
      _commoditys = data.map((value) => CommodityModel.fromJson(value)).toList();
      return _commoditys;
    });
    // print(listModel);
  }
}
