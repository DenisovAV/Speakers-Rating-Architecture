
import 'package:rating_redux/actions/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, SpeakersLoadedAction>(_setLoaded),
  TypedReducer<bool, SpeakersNotLoadedAction>(_setLoaded),
  TypedReducer<bool, TalksLoadedAction>(_setLoaded),
  TypedReducer<bool, TalksNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
