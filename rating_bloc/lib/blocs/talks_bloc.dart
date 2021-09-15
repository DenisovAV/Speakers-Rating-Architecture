import 'dart:async';

import 'package:rating_bloc/actions/actions.dart';
import 'package:rating_bloc/models/state/talks_state.dart';
import 'package:rating_bloc/repository/talks_repository.dart';

class TalksBloc {
  final TalksRepository _talksRepository;

  var _currentState = TalksState();

  final _stateController = StreamController<TalksState>();
  final _actionsController = StreamController<Action>();

  Stream<TalksState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;

  TalksBloc(this._talksRepository) {
    _actionsController.stream.listen(handleAction);
  }

  void dispose() {
    _stateController.close();
    _actionsController.close();
  }

  void handleAction(Action action) async {
    if (action is LoadTalksAction) {
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
    }
    _stateController.add(_currentState);
  }
}
