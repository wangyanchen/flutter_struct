import 'package:flutter/material.dart';
class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    print('search');
    return Container(
      child: Scaffold(
        body: Center(
          child: Text('search'),
        ),
      ),
    );
  }
}