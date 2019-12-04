import 'package:rating_redux/actions/actions.dart';
import 'package:rating_redux/models/app_state.dart';
import 'package:rating_redux/repository/speakers_repository.dart';
import 'package:rating_redux/repository/talks_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware(
    [SpeakersRepository speakersRepo = const ConstSpeakersRepository(),
    TalksRepository talksRepo = const ConstTalksRepository()]) {
  final saveSpeakers = _createSaveSpeakers(speakersRepo);
  final loadSpeakers = _createLoadSpeakers(speakersRepo);
  final saveTalks = _createSaveTalks(talksRepo);
  final loadTalks = _createLoadTalks(talksRepo);

  return [
    TypedMiddleware<AppState, LoadSpeakersAction>(loadSpeakers),
    TypedMiddleware<AppState, UpdateSpeakerAction>(saveSpeakers),
    TypedMiddleware<AppState, LoadTalksAction>(loadTalks),
    TypedMiddleware<AppState, UpdateSpeakerAction>(saveTalks),
  ];
}

Middleware<AppState> _createSaveSpeakers(SpeakersRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveSpeakers(
      store.state.speakers,
    );
  };
}

Middleware<AppState> _createLoadSpeakers(SpeakersRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository
        .loadSpeakers()
        .then((speakers) => store.dispatch(
              SpeakersLoadedAction(
                speakers,
              ),
            ))
        .catchError((_) => store.dispatch(SpeakersNotLoadedAction()));

    next(action);
  };
}

Middleware<AppState> _createSaveTalks(TalksRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveTalks(
      store.state.talks,
    );
  };
}

Middleware<AppState> _createLoadTalks(TalksRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository
        .loadTalks()
        .then((talks) => store.dispatch(
              TalksLoadedAction(
                talks,
              ),
            ))
        .catchError((_) => store.dispatch(TalksNotLoadedAction()));

    next(action);
  };
}
