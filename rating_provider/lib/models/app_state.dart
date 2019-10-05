import 'package:rating_provider/models/app_tab.dart';
import 'package:rating_provider/models/filter.dart';
import 'package:rating_provider/models/speaker.dart';
import 'package:rating_provider/models/talk.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppState with ChangeNotifier {
  final List<Speaker> speakers;
  final List<ScheduledTalk> talks;
  final AppTab activeTab;
  final Filter filter;

  AppState(
      {this.speakers = const [],
      this.talks = const [],
      this.activeTab = AppTab.speakers,
      this.filter = Filter.all});

  AppState copyWith({
    List<Speaker> speakers,
    List<ScheduledTalk> talks,
    AppTab activeTab,
    Filter filter,
  }) {
    return AppState(
      speakers: speakers ?? this.speakers,
      talks: talks ?? this.talks,
      activeTab: activeTab ?? this.activeTab,
      filter: filter ?? this.filter,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          speakers == other.speakers &&
          talks == other.talks &&
          activeTab == other.activeTab &&
          filter == other.filter;

  @override
  int get hashCode => speakers.hashCode ^ talks.hashCode ^ activeTab.hashCode ^ filter.hashCode;

  @override
  String toString() {
    return 'AppState{speakers: $speakers, talks: $talks, activeTab: $activeTab, filter: $filter}';
  }
}
