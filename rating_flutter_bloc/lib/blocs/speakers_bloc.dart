import 'dart:async';

import 'package:rating_flutter_bloc/actions/actions.dart';
import 'package:rating_flutter_bloc/models/state/speakers_state.dart';
import 'package:rating_flutter_bloc/repository/speakers_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeakersBloc extends Bloc<Action, SpeakersState> {
  final SpeakersRepository _speakersRepository;

  SpeakersBloc(this._speakersRepository) : super(SpeakersState());

  @override
  Stream<SpeakersState> mapEventToState(Action action) async* {
    if (action is LoadSpeakersAction) {
      try {
        final list = await _speakersRepository.loadSpeakers();
        yield state.copyWith(speakers: list, isLoading: false);
      } on Exception {
        yield state.copyWith(speakers: [], isLoading: false);
      }
    } else if (action is UpdateSpeakerAction) {
      _speakersRepository.saveSpeaker(action.updatedSpeaker);
      final list = state.speakers
          .map(
              (speaker) => speaker.id == action.updatedSpeaker.id ? action.updatedSpeaker : speaker)
          .toList();
      yield state.copyWith(speakers: list);
    }
  }
}
