import 'package:rating_redux/actions/actions.dart';
import 'package:rating_redux/models/speaker.dart';
import 'package:redux/redux.dart';

final speakersReducer = combineReducers<List<Speaker>>([
  TypedReducer<List<Speaker>, UpdateSpeakerAction>(_updateSpeaker),
  TypedReducer<List<Speaker>, SpeakersLoadedAction>(_setLoadedSpeakers),
  TypedReducer<List<Speaker>, SpeakersNotLoadedAction>(_setNoSpeakers),
]);

List<Speaker> _updateSpeaker(List<Speaker> speakers, UpdateSpeakerAction action) {
  return speakers
      .map((speaker) => speaker.id == action.id ? action.updatedSpeaker : speaker)
      .toList();
}

List<Speaker> _setLoadedSpeakers(List<Speaker> speakers, SpeakersLoadedAction action) {
  return action.speakers;
}

List<Speaker> _setNoSpeakers(List<Speaker> speakers, SpeakersNotLoadedAction action) {
  return [];
}
