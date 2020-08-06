import 'dart:async';

import 'package:rating_bloc/actions/actions.dart';
import 'package:rating_bloc/blocs/speakers_bloc.dart';
import 'package:rating_bloc/blocs/talks_bloc.dart';
import 'package:rating_bloc/models/state/app_state.dart';

class UiBloc {
  final SpeakersBloc speakersBloc;
  final TalksBloc talksBloc;

  var _currentState = AppState();

  final _stateController = StreamController<AppState>();
  final _actionsController = StreamController<Action>();

  Stream<AppState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;

  UiBloc(this.speakersBloc, this.talksBloc) {
    speakersBloc.state.listen((state) {
      _currentState = _currentState.copyWith(speakersState: state);
      _stateController.add(_currentState);
    });
    talksBloc.state.listen((state) {
      _currentState = _currentState.copyWith(talksState: state);
      _stateController.add(_currentState);
    });
    _actionsController.stream.listen((action) {
      if (action is UpdateTabAction) {
        _currentState = _currentState.copyWith(activeTab: action.newTab);
        _stateController.add(_currentState);
      } else if (action is SpeakersAction) {
        speakersBloc.action.add(action);
      } else if (action is TalksAction) {
        talksBloc.action.add(action);
      }
    });
  }

  void dispose() {
    speakersBloc.dispose();
    talksBloc.dispose();
    _stateController.close();
    _actionsController.close();
  }
}
