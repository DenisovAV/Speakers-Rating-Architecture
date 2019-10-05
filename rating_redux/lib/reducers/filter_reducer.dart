import 'package:rating_redux/actions/actions.dart';
import 'package:rating_redux/models/filter.dart';
import 'package:redux/redux.dart';

final filterReducer = combineReducers<Filter>([
  TypedReducer<Filter, UpdateFilterAction>(_activeFilterReducer),
]);

Filter _activeFilterReducer(Filter activeFilter, UpdateFilterAction action) {
  return action.newFilter;
}
