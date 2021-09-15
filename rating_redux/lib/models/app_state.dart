import 'package:rating_redux/models/app_tab.dart';
import 'package:rating_redux/models/filter.dart';
import 'package:rating_redux/models/speaker.dart';
import 'package:rating_redux/models/talk.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Speaker> speakers;
  final List<ScheduledTalk> talks;
  final AppTab activeTab;
  final Filter filter;

  const AppState(
      {this.isLoading = false,
      this.speakers = const [],
      this.talks = const [],
      this.activeTab = AppTab.speakers,
      this.filter = Filter.all});

  factory AppState.loading() => const AppState(isLoading: true);

  AppState copyWith({
    bool? isLoading,
    List<Speaker>? speakers,
    List<ScheduledTalk>? talks,
    AppTab? activeTab,
    Filter? filter,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
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
          isLoading == other.isLoading &&
          speakers == other.speakers &&
          talks == other.talks &&
          activeTab == other.activeTab &&
          filter == other.filter;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      speakers.hashCode ^
      talks.hashCode ^
      activeTab.hashCode ^
      filter.hashCode;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, '
        'speakers: $speakers, talks: $talks, activeTab: $activeTab, filter: $filter}';
  }
}
