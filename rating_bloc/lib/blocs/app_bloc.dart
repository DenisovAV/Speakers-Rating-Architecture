import 'dart:async';

import 'package:rating_bloc/actions/actions.dart';
import 'package:rating_bloc/models/app_state.dart';
import 'package:rating_bloc/repository/speakers_repository.dart';
import 'package:rating_bloc/repository/talks_repository.dart';

class AppBloc {
  final SpeakersRepository _speakersRepository;
  final TalksRepository _talksRepository;

  AppState _currentState = AppState();

  final _stateController = StreamController<AppState>();
  final _actionsController = StreamController<Action>();

  Stream<AppState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;

  AppBloc(this._speakersRepository, this._talksRepository) {
    _actionsController.stream.listen(handleAction);
  }

  void dispose() {
    _stateController.close();
    _actionsController.close();
  }

  void handleAction(Action action) async {
    if (action is LoadSpeakersAction) {
      try {
        final list = await _speakersRepository.loadSpeakers();
        _currentState = _currentState.copyWith(speakers: list);
      } on Exception {
        _currentState = _currentState.copyWith(speakers: []);
      }
    } else if (action is UpdateSpeakerAction) {
      _speakersRepository.saveSpeaker(action.updatedSpeaker);
      final list = _currentState.speakers
          .map(
              (speaker) => speaker.id == action.updatedSpeaker.id ? action.updatedSpeaker : speaker)
          .toList();
      _currentState = _currentState.copyWith(speakers: list);
    } else if (action is LoadTalksAction) {
      try {
        final list = await _talksRepository.loadTalks();
        _currentState = _currentState.copyWith(talks: list);
      } on Exception {
        _currentState = _currentState.copyWith(talks: []);
      }
    } else if (action is UpdateTalkAction) {
      _talksRepository.saveTalk(action.updatedTalk);
      final list = _currentState.talks
          .map((talk) => talk.id == action.updatedTalk.id ? action.updatedTalk : talk)
          .toList();
      _currentState = _currentState.copyWith(talks: list);
    } else if (action is UpdateFilterAction) {
      _currentState = _currentState.copyWith(filter: action.newFilter);
    } else if (action is UpdateTabAction) {
      _currentState = _currentState.copyWith(activeTab: action.newTab);
    }
    _stateController.add(_currentState);
  }
}
