import 'package:rating_flutter_bloc/models/speaker.dart';

class ScheduledTalk {
  final int id;
  final String time;
  final Speaker speaker;
  final String topic;
  final bool isFavourite;

  const ScheduledTalk(this.id, this.time, {this.speaker, this.topic, this.isFavourite = false});

  ScheduledTalk copyWith(
      {String id, DateTime time, String speaker, String topic, bool isFavourite}) {
    return ScheduledTalk(id ?? this.id, time ?? this.time,
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
