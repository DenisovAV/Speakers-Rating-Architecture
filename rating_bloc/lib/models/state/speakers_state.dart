import 'package:rating_bloc/models/filter.dart';
import 'package:rating_bloc/models/speaker.dart';

class SpeakersState {
  final List<Speaker> speakers;
  final Filter filter;

  const SpeakersState({
    this.speakers = const [],
    this.filter = Filter.all,
  });

  SpeakersState copyWith({
    List<Speaker>? speakers,
    Filter? filter,
  }) {
    return SpeakersState(
      speakers: speakers ?? this.speakers,
      filter: filter ?? this.filter,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpeakersState &&
          runtimeType == other.runtimeType &&
          speakers == other.speakers &&
          filter == other.filter;

  @override
  int get hashCode => speakers.hashCode ^ filter.hashCode;

  @override
  String toString() => 'SpeakersState{speakers: $speakers, filter: $filter}';
}
