import 'package:rating_redux/actions/actions.dart';
import 'package:rating_redux/models/app_tab.dart';
import 'package:redux/redux.dart';

final tabsReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action) {
  return action.newTab;
}
