import 'package:flutter/material.dart';
import 'package:flutter_struct/models/category.dart';
class HomeCategory extends StatefulWidget {
  final CategoryModel category;
  HomeCategory(this.category);
  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  CategoryModel category;
  String id;
  @override
  void initState() {
    super.initState();
    category = widget.category;
    id = category.id;
  }
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(20.0),
          child: Text(category.name),
        );
      } ,
    );
  }
}