import 'package:meta/meta.dart';

@immutable
class Speaker {
  final String id;
  final String name;
  final String topic;
  final int? rating;

  const Speaker({required this.id, required this.name, this.rating, this.topic = ''});

  Speaker copyWith({String? id, String? name, String? topic, int? rating}) {
    return Speaker(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      topic: topic ?? this.topic,
    );
  }

  String get assetName => 'assets/images/$id.jpg';

  @override
  int get hashCode => name.hashCode ^ topic.hashCode ^ id.hashCode;

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
