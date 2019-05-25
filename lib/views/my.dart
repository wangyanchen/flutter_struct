import 'package:flutter/material.dart';
class MyView extends StatefulWidget {
  @override
  _MyViewState createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  @override
  Widget build(BuildContext context) {
    print('my');
    return Container(
      child: Scaffold(
        body: Center(
          child: Text('My'),
        ),
      ),
    );
  }
}