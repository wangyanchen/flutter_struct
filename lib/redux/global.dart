import 'package:redux/redux.dart';

class GlobalState {
  final int tabIndex;
  GlobalState({
    this.tabIndex = 0
  });
  
  factory GlobalState.initial() => new GlobalState();
}

class GlobalIndexAction {
  final int index;
  GlobalIndexAction(this.index);
}

final globalReducer = combineReducers<GlobalState>([
  TypedReducer<GlobalState, GlobalIndexAction>(_setIndex)
]);
GlobalState _setIndex(GlobalState state, GlobalIndexAction action) {
  return GlobalState(tabIndex: action.index);
}
