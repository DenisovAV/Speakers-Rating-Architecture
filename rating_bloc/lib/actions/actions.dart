
import 'package:rating_bloc/models/app_tab.dart';
import 'package:rating_bloc/models/filter.dart';
import 'package:rating_bloc/models/speaker.dart';
import 'package:rating_bloc/models/talk.dart';

abstract class Action{}

class LoadSpeakersAction extends Action {}

class SpeakersNotLoadedAction extends Action {}

class SpeakersLoadedAction extends Action {
  final List<Speaker> speakers;

  SpeakersLoadedAction(this.speakers);
}

class UpdateSpeakerAction extends Action {
  final Speaker updatedSpeaker;

  UpdateSpeakerAction(this.updatedSpeaker);
}

class UpdateFilterAction extends Action{
  final Filter newFilter;

  UpdateFilterAction(this.newFilter);
}

class UpdateTabAction extends Action{
  final AppTab newTab;

  UpdateTabAction(this.newTab);
}

class LoadTalksAction extends Action{}

class TalksNotLoadedAction extends Action{}

class TalksLoadedAction extends Action{
  final List<ScheduledTalk> talks;

  TalksLoadedAction(this.talks);
}

class UpdateTalkAction extends Action{
  final ScheduledTalk updatedTalk;

  UpdateTalkAction(this.updatedTalk);
}


