import 'package:meta/meta.dart';

@immutable
class ScheduledTalk {
  final String id;
  final String time;
  final String speaker;
  final String topic;
  final bool isFavourite;

  const ScheduledTalk(
      {required this.id,
      required this.time,
      required this.speaker,
      required this.topic,
      this.isFavourite = false});

  ScheduledTalk copyWith(
      {String? id, DateTime? time, String? speaker, String? topic, bool? isFavourite}) {
    return ScheduledTalk(
        id: id ?? this.id,
        time: time?.toString() ?? this.time,
        speaker: speaker ?? this.speaker,
        topic: topic ?? this.topic,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledTalk &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          time == other.time &&
          speaker == other.speaker &&
          topic == other.topic;

  @override
  int get hashCode => id.hashCode ^ time.hashCode ^ speaker.hashCode ^ topic.hashCode;

  @override
  String toString() {
    return 'ScheduledTalk{id: $id, time: $time, speaker: $speaker, topic: $topic, isFavourite: $isFavourite}';
  }
}
