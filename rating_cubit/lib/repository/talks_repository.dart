import 'package:rating_cubit/models/talk.dart';
import 'package:rating_cubit/repository/speakers_repository.dart';
import 'dart:async';

abstract class TalksRepository {

  TalksRepository();

  Future<List<ScheduledTalk>> getTalks();

  Future<List<ScheduledTalk>> getTalksBySpeakerId({int speakerId});

  Future<ScheduledTalk> getTalkById({int id});

  void saveTalk(ScheduledTalk talks);
}

class ConstTalksRepository extends TalksRepository{
  final ConstSpeakersRepository _speakersRepository;
  final _allTalks = <ScheduledTalk>[];

  ConstTalksRepository(this._speakersRepository);

  Future<List<ScheduledTalk>> _initializeTalks() async {
    _allTalks.addAll([
      ScheduledTalk(0, '9:00', topic: 'Завтрак'),
      ScheduledTalk(1, '9:30',
          speaker: await _speakersRepository.getSpeakerById(id: 0), topic: 'Неизвестно'),
      ScheduledTalk(2, '10:10',
          speaker: await _speakersRepository.getSpeakerById(id: 1),
          topic: 'Лайфхаки в работе с техподдержкой Google Play Store и App Store Connect'),
      ScheduledTalk(3, '10:50',
          speaker: await _speakersRepository.getSpeakerById(id: 2),
          topic: 'Flutter State Management Wars. BLoC vs Redux'),
      ScheduledTalk(4, '11:30',
          speaker: await _speakersRepository.getSpeakerById(id: 4),
          topic: 'Как правильно продать себя ради фана и профита'),
      ScheduledTalk(5, '12:10',
          speaker: await _speakersRepository.getSpeakerById(id: 5),
          topic: 'Mutation Testing at Scale'),
      ScheduledTalk(6, '13:00', topic: 'Обед'),
      ScheduledTalk(7, '14:00',
          speaker: await _speakersRepository.getSpeakerById(id: 6),
          topic: 'UI Automator deep diving'),
      ScheduledTalk(8, '14:40',
          speaker: await _speakersRepository.getSpeakerById(id: 6),
          topic: 'How to win friends and influence people, on mobile'),
      ScheduledTalk(9, '15:20',
          speaker: await _speakersRepository.getSpeakerById(id: 7),
          topic: 'Воспроизводимость End-to-end тестов, или «Ходим под себя»'),
      ScheduledTalk(10, '16:00',
          speaker: await _speakersRepository.getSpeakerById(id: 8),
          topic: 'Как происходит рендеринг экрана сообщений ВКонтакте'),
      ScheduledTalk(11, '16:40', topic: 'Закрытие'),
    ]);
    return _allTalks;
  }

  @override
  Future<List<ScheduledTalk>> getTalks() async {
    return _allTalks.isNotEmpty ? _allTalks : await _initializeTalks();
  }

  @override
  Future<List<ScheduledTalk>> getTalksBySpeakerId({int speakerId}) async {
    return _allTalks.where((talk) => talk.speaker.id == speakerId);
  }

  @override
  Future<ScheduledTalk> getTalkById({int id}) async {
    return _allTalks.firstWhere((talk) => talk.id == id);
  }

  @override
  void saveTalk(ScheduledTalk talks) {
    //Here should be saving item to repository
    return null;
  }
}
