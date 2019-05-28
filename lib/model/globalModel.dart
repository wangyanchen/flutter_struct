import 'package:flutter_struct/redux/global.dart';

class GlobalModel {
  final GlobalState state;
  final void Function(int index ) setIndex;
  GlobalModel({ this.state, this.setIndex});
}