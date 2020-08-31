import 'package:rating_riverpod/models/speaker.dart';
import 'package:rating_riverpod/models/talk.dart';
import 'package:rating_riverpod/repository/speakers_repository.dart';
import 'package:rating_riverpod/repository/talks_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class SpeakersNotifier extends StateNotifier<List<Speaker>> {
  final SpeakersRepository _speakersRepository;

  SpeakersNotifier(this._speakersRepository) : super([]) {
    _init();
  }

  void _init() async {
    state = await _speakersRepository.loadSpeakers();
  }

  void updateSpeaker(Speaker speaker) {
    _speakersRepository.saveSpeaker(speaker);
    state = state.map((s) => s.id == speaker.id ? speaker : s).toList();
  }
}

class TalksNotifier extends StateNotifier<List<ScheduledTalk>> {
  final TalksRepository _talksRepository;

  TalksNotifier(this._talksRepository) : super([]) {
    _init();
  }

  void _init() async {
    state = await _talksRepository.loadTalks();
  }

  void updateTalk(ScheduledTalk talk) {
    _talksRepository.saveTalk(talk);
    state = state.map((t) => t.id == talk.id ? talk : t).toList();
  }
}
