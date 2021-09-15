import 'dart:async';

import 'package:rating_flutter_bloc/actions/actions.dart';
import 'package:rating_flutter_bloc/models/state/talks_state.dart';
import 'package:rating_flutter_bloc/repository/talks_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TalksBloc extends Bloc<Action, TalksState>  {
  final TalksRepository _talksRepository;

  TalksBloc(this._talksRepository):super(TalksState());

  @override
  Stream<TalksState> mapEventToState(Action action) async* {
    if (action is LoadTalksAction) {
      try {
        final list = await _talksRepository.loadTalks();
        yield state.copyWith(talks: list, isLoading: false);
      } on Exception {
        yield state.copyWith(talks: [], isLoading: false);
      }
    } else if (action is UpdateTalkAction) {
      _talksRepository.saveTalk(action.updatedTalk);
      final list = state.talks
          .map((talk) => talk.id == action.updatedTalk.id ? action.updatedTalk : talk)
          .toList();
      yield state.copyWith(talks: list);
    }
  }
}
