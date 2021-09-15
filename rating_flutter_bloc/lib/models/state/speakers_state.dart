import 'package:rating_flutter_bloc/models/speaker.dart';

class SpeakersState {
  final List<Speaker> speakers;
  final bool isLoading;

  const SpeakersState({
    this.speakers = const [],
    this.isLoading = true,
  });

  SpeakersState copyWith({
    List<Speaker>? speakers,
    bool? isLoading,
  }) {
    return SpeakersState(
      speakers: speakers ?? this.speakers,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpeakersState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          speakers == other.speakers;

  @override
  int get hashCode => speakers.hashCode ^ isLoading.hashCode;

  @override
  String toString() => 'SpeakersState{speakers: $speakers, isLoading: $isLoading}';
}
