import 'package:rating_cubit/models/state/talks_state.dart';
import 'package:rating_cubit/repository/talks_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_cubit/models/talk.dart';

class TalksCubit extends Cubit<TalksState> {
  final TalksRepository _talksRepository;

  TalksCubit(this._talksRepository) : super(TalksState());

  void loadTalks() async {
    try {
      final list = await _talksRepository.loadTalks();
      emit(state.copyWith(talks: list, isLoading: false));
    } on Exception {
      emit(state.copyWith(talks: [], isLoading: false));
    }
  }

  void updateTalk(ScheduledTalk updatedTalk) {
    _talksRepository.saveTalk(updatedTalk);
    final list = state.talks.map((talk) => talk.id == updatedTalk.id ? updatedTalk : talk).toList();
    emit(state.copyWith(talks: list));
  }
}
