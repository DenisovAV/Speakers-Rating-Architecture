import 'package:flutter/material.dart';
import 'package:rating_provider/models/speaker.dart';
import 'package:rating_provider/models/talk.dart';
import 'package:rating_provider/repository/speakers_repository.dart';
import 'package:rating_provider/repository/talks_repository.dart';

class RatingChangeNotifier extends ChangeNotifier {
  final SpeakersRepository _speakersRepository;
  final TalksRepository _talksRepository;
  List<ScheduledTalk> _talks = [];
  List<Speaker> _speakers = [];

  List<Speaker> get speakers => _speakers;
  List<ScheduledTalk> get talks => _talks;
  bool get isLoaded => _talks.isNotEmpty && _speakers.isNotEmpty;

  RatingChangeNotifier(this._speakersRepository, this._talksRepository) {
    _speakersRepository.loadSpeakers().then((list) {
      _speakers = list;
      notifyListeners();
    });
    _talksRepository.loadTalks().then((list) {
      _talks = list;
      notifyListeners();
    });
  }

  void updateSpeaker(Speaker speaker) {
    _speakersRepository.saveSpeaker(speaker);
    _speakers = _speakers.map((s) => s.id == speaker.id ? speaker : s).toList();
    notifyListeners();
  }

  void updateTalk(ScheduledTalk talk) {
    _talksRepository.saveTalk(talk);
    _talks = _talks.map((t) => t.id == talk.id ? talk : t).toList();
    notifyListeners();
  }
}
