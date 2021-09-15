import 'package:rating_bloc/models/talk.dart';

class TalksState {
  final List<ScheduledTalk> talks;

  const TalksState({
    this.talks = const [],
  });

  TalksState copyWith({
    List<ScheduledTalk>? talks,
  }) {
    return TalksState(
      talks: talks ?? this.talks,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TalksState && runtimeType == other.runtimeType && talks == other.talks;

  @override
  int get hashCode => talks.hashCode;

  @override
  String toString() => 'TalksState{talks: $talks}';
}
