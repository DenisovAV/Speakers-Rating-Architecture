import 'package:rating_mobx/models/talk.dart';

abstract class TalksRepository {
  const TalksRepository();

  Future<List<ScheduledTalk>> loadTalks();

  Future saveTalk(ScheduledTalk talks);
}

class ConstTalksRepository extends TalksRepository {
  const ConstTalksRepository();

  static const _allTalks = <ScheduledTalk>[
    ScheduledTalk(0, '9:00', speaker: '', topic: 'Завтрак'),
    ScheduledTalk(1, '9:30', speaker: 'Йонатан Левин', topic: 'Неизвестно'),
    ScheduledTalk(2, '10:10',
        speaker: 'Марина Плешкова',
        topic: 'Лайфхаки в работе с техподдержкой Google Play Store и App Store Connect'),
    ScheduledTalk(3, '10:50',
        speaker: 'Александр Денисов', topic: 'Flutter State Management Wars. BLoC vs Redux'),
    ScheduledTalk(4, '11:30',
        speaker: 'Барух Садогурский', topic: 'Как правильно продать себя ради фана и профита'),
    ScheduledTalk(5, '12:10', speaker: 'Giorgio Natili', topic: 'Mutation Testing at Scale'),
    ScheduledTalk(6, '13:00', speaker: '', topic: 'Обед'),
    ScheduledTalk(7, '14:00', speaker: 'Светлана Смельчакова', topic: 'UI Automator deep diving'),
    ScheduledTalk(8, '14:40',
        speaker: 'Виталий Фридман', topic: 'How to win friends and influence people, on mobile'),
    ScheduledTalk(9, '15:20',
        speaker: 'Борис Бенгус',
        topic: 'Воспроизводимость End-to-end тестов, или «Ходим под себя»'),
    ScheduledTalk(10, '16:00',
        speaker: 'Александр Сорокин', topic: 'Как происходит рендеринг экрана сообщений ВКонтакте'),
    ScheduledTalk(11, '16:40', speaker: '', topic: 'Закрытие'),
  ];

  @override
  Future<List<ScheduledTalk>> loadTalks() async {
    return _allTalks;
  }

  @override
  Future saveTalk(ScheduledTalk talks) {
    //Here should be saving item to repository
    return null;
  }
}
