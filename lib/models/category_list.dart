import 'package:flutter_struct/models/category.dart';
import 'package:flutter_struct/api/category.dart';
class CategoryListModel {
  static List<CategoryModel> get categorys => _categorys.toList();
  static List<CategoryModel> _categorys = [];
  Future getList() async {
    final Map<String, dynamic> params = {
      'limit': 100,
      'fields': 'id,icon,image,name,status,parentid'
    };
    return CategoryApi.list(params).then((res) {
      List data = res['data'];
      _categorys = data.map((value) => CategoryModel.fromJson(value)).toList();
      return _categorys;
    });
    // print(listModel);
  }
}
