import 'package:mobx/mobx.dart';
import 'package:rating_mobx/models/speaker.dart';
import 'package:rating_mobx/models/talk.dart';
import 'package:rating_mobx/repository/speakers_repository.dart';
import 'package:rating_mobx/repository/talks_repository.dart';
import 'package:rating_mobx/models/filter.dart';
import 'package:rating_mobx/models/app_tab.dart';

part 'rating_observable.g.dart';

class RatingState = _RatingState with _$RatingState;

abstract class _RatingState with Store {
  final SpeakersRepository _speakersRepository;
  final TalksRepository _talksRepository;

  @observable
  List<ScheduledTalk> talks = [];

  @observable
  List<Speaker> speakers = [];

  @observable
  Filter? activeFilter;

  @observable
  int activeTabIndex = AppTab.speakers.index;

  @computed
  bool get isLoaded => talks.isNotEmpty && speakers.isNotEmpty;

  @computed
  List<Speaker> get filteredSpeakers => speakers.where((s) {
        if (activeFilter == Filter.top) {
          return s.rating == 5;
        } else if (activeFilter == Filter.unrated) {
          return s.rating == null;
        } else {
          return true;
        }
      }).toList();

  _RatingState(this._speakersRepository, this._talksRepository) {
    _initSpeakers();
    _initTalks();
  }

  @action
  Future<void> _initSpeakers() async {
    speakers = await _speakersRepository.loadSpeakers();
  }

  @action
  Future<void> _initTalks() async {
    talks = await _talksRepository.loadTalks();
  }

  @action
  void updateSpeaker(Speaker speaker) {
    _speakersRepository.saveSpeaker(speaker);
    speakers = speakers.map((s) => s.id == speaker.id ? speaker : s).toList();
  }

  @action
  void updateTalk(ScheduledTalk talk) {
    _talksRepository.saveTalk(talk);
    talks = talks.map((t) => t.id == talk.id ? talk : t).toList();
  }

  @action
  void updateFilter(Filter filter) {
    activeFilter = filter;
  }

  @action
  void updateTab(int index) {
    activeTabIndex = index;
  }
}
