import 'package:rating_cubit/models/talk.dart';

class TalksState {
  final List<ScheduledTalk> talks;
  final bool isLoading;

  const TalksState({
    this.talks = const [],
    this.isLoading = true,
  });

  TalksState copyWith({
    List<ScheduledTalk>? talks,
    bool? isLoading,
  }) {
    return TalksState(
      talks: talks ?? this.talks,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TalksState &&
          runtimeType == other.runtimeType &&
          talks == other.talks &&
          isLoading == other.isLoading;

  @override
  int get hashCode => talks.hashCode ^ isLoading.hashCode;

  @override
  String toString() => 'TalksState{talks: $talks, isLoading: $isLoading}';
}
