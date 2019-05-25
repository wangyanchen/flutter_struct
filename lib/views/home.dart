import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    print('home');
    return Container(
      child: Scaffold(
        body: Center(
          child: Text('home'),
        ),        
      )
    );
  }
}