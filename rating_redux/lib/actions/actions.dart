
import 'package:rating_redux/models/app_tab.dart';
import 'package:rating_redux/models/filter.dart';
import 'package:rating_redux/models/speaker.dart';
import 'package:rating_redux/models/talk.dart';

class LoadSpeakersAction {}

class SpeakersNotLoadedAction {}

class SpeakersLoadedAction {
  final List<Speaker> speakers;

  SpeakersLoadedAction(this.speakers);
}

class UpdateSpeakerAction {
  final String id;
  final Speaker updatedSpeaker;

  UpdateSpeakerAction(this.id, this.updatedSpeaker);
}

class LoadTalksAction {}

class TalksNotLoadedAction {}

class TalksLoadedAction {
  final List<ScheduledTalk> talks;

  TalksLoadedAction(this.talks);
}

class UpdateTalkAction {
  final String id;
  final ScheduledTalk updatedTalk;

  UpdateTalkAction(this.id, this.updatedTalk);
}

class UpdateFilterAction {
  final Filter newFilter;

  UpdateFilterAction(this.newFilter);
}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);
}
