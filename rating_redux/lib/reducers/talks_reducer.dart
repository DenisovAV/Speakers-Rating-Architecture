import 'package:rating_redux/actions/actions.dart';
import 'package:rating_redux/models/talk.dart';
import 'package:redux/redux.dart';

final talksReducer = combineReducers<List<ScheduledTalk>>([
  TypedReducer<List<ScheduledTalk>, UpdateTalkAction>(_updateTalk),
  TypedReducer<List<ScheduledTalk>, TalksLoadedAction>(_setLoadedTalks),
  TypedReducer<List<ScheduledTalk>, TalksNotLoadedAction>(_setNoTalks),
]);

List<ScheduledTalk> _updateTalk(List<ScheduledTalk> talks, UpdateTalkAction action) {
  return talks.map((talk) => talk.id == action.id ? action.updatedTalk : talk).toList();
}

List<ScheduledTalk> _setLoadedTalks(List<ScheduledTalk> speakers, TalksLoadedAction action) {
  return action.talks;
}

List<ScheduledTalk> _setNoTalks(List<ScheduledTalk> talks, TalksNotLoadedAction action) {
  return [];
}
