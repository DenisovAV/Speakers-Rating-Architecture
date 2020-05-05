import 'package:rating_bloc/models/app_tab.dart';
import 'package:rating_bloc/models/filter.dart';
import 'package:rating_bloc/models/speaker.dart';
import 'package:rating_bloc/models/talk.dart';

abstract class Action {}

abstract class SpeakersAction extends Action {}

abstract class TalksAction extends Action {}

class LoadSpeakersAction extends SpeakersAction {}

class SpeakersNotLoadedAction extends SpeakersAction {}

class SpeakersLoadedAction extends SpeakersAction {
  final List<Speaker> speakers;

  SpeakersLoadedAction(this.speakers);
}

class UpdateSpeakerAction extends SpeakersAction {
  final Speaker updatedSpeaker;

  UpdateSpeakerAction(this.updatedSpeaker);
}

class UpdateFilterAction extends SpeakersAction {
  final Filter newFilter;

  UpdateFilterAction(this.newFilter);
}

class UpdateTabAction extends Action {
  final AppTab newTab;

  UpdateTabAction(this.newTab);
}

class LoadTalksAction extends TalksAction {}

class TalksNotLoadedAction extends TalksAction {}

class TalksLoadedAction extends TalksAction {
  final List<ScheduledTalk> talks;

  TalksLoadedAction(this.talks);
}

class UpdateTalkAction extends TalksAction {
  final ScheduledTalk updatedTalk;

  UpdateTalkAction(this.updatedTalk);
}
