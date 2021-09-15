import 'package:rating_bloc/models/app_tab.dart';
import 'package:rating_bloc/models/state/speakers_state.dart';
import 'package:rating_bloc/models/state/talks_state.dart';

class AppState {
  final SpeakersState speakersState;
  final TalksState talksState;
  final AppTab activeTab;

  const AppState(
      {this.speakersState = const SpeakersState(),
      this.talksState = const TalksState(),
      this.activeTab = AppTab.speakers});

  AppState copyWith({
    SpeakersState? speakersState,
    TalksState? talksState,
    AppTab? activeTab,
  }) {
    return AppState(
      speakersState: speakersState ?? this.speakersState,
      talksState: talksState ?? this.talksState,
      activeTab: activeTab ?? this.activeTab,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          speakersState == other.speakersState &&
          talksState == other.talksState;

  @override
  int get hashCode => speakersState.hashCode ^ talksState.hashCode ^ activeTab.hashCode;

  @override
  String toString() =>
      'AppState{speakersState: $speakersState, talksState: $talksState, activeTab: $activeTab}';
}
