import 'package:flutter/material.dart';
import 'package:rating_provider/models/speaker.dart';
import 'package:rating_provider/models/talk.dart';
import 'package:rating_provider/repository/speakers_repository.dart';
import 'package:rating_provider/repository/talks_repository.dart';
import 'package:rating_provider/models/filter.dart';
import 'package:rating_provider/models/app_tab.dart';

class RatingAppState with ChangeNotifier {
  final SpeakersRepository _speakersRepository;
  final TalksRepository _talksRepository;
  List<ScheduledTalk> talks = [];
  List<Speaker> speakers = [];
  Filter? activeFilter;
  int activeTabIndex = AppTab.speakers.index;

  bool get isLoaded => talks.isNotEmpty && speakers.isNotEmpty;

  List<Speaker> get filteredSpeakers => speakers.where((s) {
        if (activeFilter == Filter.top) {
          return s.rating == 5;
        } else if (activeFilter == Filter.unrated) {
          return s.rating == null;
        } else {
          return true;
        }
      }).toList();

  RatingAppState(this._speakersRepository, this._talksRepository) {
    _initSpeakers();
    _initTalks();
  }

  void _initSpeakers() async {
    speakers = await _speakersRepository.loadSpeakers();
    notifyListeners();
  }

  void _initTalks() async {
    talks = await _talksRepository.loadTalks();
    notifyListeners();
  }

  void updateSpeaker(Speaker speaker) {
    _speakersRepository.saveSpeaker(speaker);
    speakers = speakers.map((s) => s.id == speaker.id ? speaker : s).toList();
    notifyListeners();
  }

  void updateTalk(ScheduledTalk talk) {
    _talksRepository.saveTalk(talk);
    talks = talks.map((t) => t.id == talk.id ? talk : t).toList();
    notifyListeners();
  }

  void updateFilter(Filter filter) {
    activeFilter = filter;
    notifyListeners();
  }

  void updateTab(int index) {
    activeTabIndex = index;
    notifyListeners();
  }
}
