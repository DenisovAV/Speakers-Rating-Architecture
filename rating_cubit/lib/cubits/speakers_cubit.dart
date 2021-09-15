import 'package:rating_cubit/models/state/speakers_state.dart';
import 'package:rating_cubit/repository/speakers_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_cubit/models/speaker.dart';

class SpeakersCubit extends Cubit<SpeakersState> {
  final SpeakersRepository _speakersRepository;

  SpeakersCubit(this._speakersRepository) : super(SpeakersState());

  void loadSpeakers() async {
    try {
      final list = await _speakersRepository.loadSpeakers();
      emit(state.copyWith(speakers: list, isLoading: false));
    } on Exception {
      emit(state.copyWith(speakers: [], isLoading: false));
    }
  }

  void updateSpeaker(Speaker updatedSpeaker) {
    _speakersRepository.saveSpeaker(updatedSpeaker);
    final list = state.speakers
        .map((speaker) => speaker.id == updatedSpeaker.id ? updatedSpeaker : speaker)
        .toList();
    emit(state.copyWith(speakers: list));
  }
}
