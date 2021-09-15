import 'package:rating_mobx/models/talk.dart';

abstract class TalksRepository {
  const TalksRepository();

  Future<List<ScheduledTalk>> loadTalks();

  Future<void> saveTalk(ScheduledTalk talks);
}

class ConstTalksRepository extends TalksRepository {
  const ConstTalksRepository();

  static const _allTalks = <ScheduledTalk>[
    ScheduledTalk(id: '0', time: '9:00', speaker: '', topic: 'Завтрак'),
    ScheduledTalk(id: '1', time: '9:30', speaker: 'Йонатан Левин', topic: 'Неизвестно'),
    ScheduledTalk(
        id: '2',
        time: '10:10',
        speaker: 'Марина Плешкова',
        topic: 'Лайфхаки в работе с техподдержкой Google Play Store и App Store Connect'),
    ScheduledTalk(
        id: '3',
        time: '10:50',
        speaker: 'Александр Денисов',
        topic: 'Flutter State Management Wars. BLoC vs Redux'),
    ScheduledTalk(
        id: '4',
        time: '11:30',
        speaker: 'Барух Садогурский',
        topic: 'Как правильно продать себя ради фана и профита'),
    ScheduledTalk(
        id: '5', time: '12:10', speaker: 'Giorgio Natili', topic: 'Mutation Testing at Scale'),
    ScheduledTalk(id: '6', time: '13:00', speaker: '', topic: 'Обед'),
    ScheduledTalk(
        id: '7', time: '14:00', speaker: 'Светлана Смельчакова', topic: 'UI Automator deep diving'),
    ScheduledTalk(
        id: '8',
        time: '14:40',
        speaker: 'Виталий Фридман',
        topic: 'How to win friends and influence people, on mobile'),
    ScheduledTalk(
        id: '9',
        time: '15:20',
        speaker: 'Борис Бенгус',
        topic: 'Воспроизводимость End-to-end тестов, или «Ходим под себя»'),
    ScheduledTalk(
        id: '10',
        time: '16:00',
        speaker: 'Александр Сорокин',
        topic: 'Как происходит рендеринг экрана сообщений ВКонтакте'),
    ScheduledTalk(id: '11', time: '16:40', speaker: '', topic: 'Закрытие'),
  ];

  @override
  Future<List<ScheduledTalk>> loadTalks() async {
    return _allTalks;
  }

  @override
  Future<void> saveTalk(ScheduledTalk talks) async {
    //Here should be saving item to repository
    return;
  }
}
