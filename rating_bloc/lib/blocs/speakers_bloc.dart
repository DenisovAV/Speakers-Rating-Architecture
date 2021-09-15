import 'dart:async';

import 'package:rating_bloc/actions/actions.dart';
import 'package:rating_bloc/models/state/speakers_state.dart';
import 'package:rating_bloc/repository/speakers_repository.dart';


class SpeakersBloc {
  final SpeakersRepository _speakersRepository;

  var _currentState = SpeakersState();

  final _stateController = StreamController<SpeakersState>();
  final _actionsController = StreamController<Action>();

  Stream<SpeakersState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;

  SpeakersBloc(this._speakersRepository) {
    _actionsController.stream.listen(_handleAction);
  }

  void dispose() {
    _stateController.close();
    _actionsController.close();
  }

  void _handleAction(Action action) async {
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
    } else if (action is UpdateFilterAction) {
      _currentState = _currentState.copyWith(filter: action.newFilter);
    }
    _stateController.add(_currentState);
  }
}
