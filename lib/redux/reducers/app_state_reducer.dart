import 'package:flutter_struct/models/app_state_model.dart';
import 'package:flutter_struct/models/models.dart';
import 'package:flutter_struct/redux/reducers/global.dart';
AppState appReducer(AppState state, action) {
  return AppState(
    activeTab: globalReducer(state.activeTab, action)
  );
} 