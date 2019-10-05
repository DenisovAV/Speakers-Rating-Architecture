import 'package:meta/meta.dart';

@immutable
class Speaker {
  final int id;
  final String name;
  final String topic;
  final int rating;

  const Speaker(this.id, this.name, {this.rating, String topic})
      : this.topic = topic ?? '';

  Speaker copyWith({String id, String name, String topic, int rating}) {
    return Speaker(
      id ?? this.id,
      name ?? this.name,
      rating: rating ?? this.rating,
      topic: topic ?? this.topic,
    );
  }

  String get assetName => 'assets/images/$id.jpg';

  @override
  int get hashCode =>
      name.hashCode ^ topic.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Speaker &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          topic == other.topic &&
          id == other.id;

  @override
  String toString() {
    return 'Speaker{id: $id, name: $name, topic: $topic, rating: $rating}';
  }
}
