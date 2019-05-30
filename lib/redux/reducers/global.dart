import 'package:redux/redux.dart';
import '../actions/actions.dart';
// import '../../models/models.dart';
final globalReducer = combineReducers<int>([
  TypedReducer<int, SelectTabAction>(_setIndex),
]);
int _setIndex(int activeTab, SelectTabAction action) {
  return action.activeTab;
}