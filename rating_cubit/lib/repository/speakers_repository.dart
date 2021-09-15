import 'package:rating_cubit/models/speaker.dart';

abstract class SpeakersRepository {
  const SpeakersRepository();

  Future<List<Speaker>> loadSpeakers();

  Future<void> saveSpeaker(Speaker speaker);
}

class ConstSpeakersRepository extends SpeakersRepository {
  const ConstSpeakersRepository();

  static const _allSpeakers = <Speaker>[
    Speaker(id: '0', name: 'Йонатан Левин', topic: 'Неизвестно', rating: 4),
    Speaker(
        id: '1',
        name: 'Марина Плешкова',
        topic: 'Лайфхаки в работе с техподдержкой Google Play Store и App Store Connect',
        rating: 5),
    Speaker(
        id: '2', name: 'Александр Денисов', topic: 'Flutter State Management Wars. BLoC vs Redux'),
    Speaker(
        id: '3',
        name: 'Барух Садогурский',
        topic: 'Как правильно продать себя ради фана и профита',
        rating: 3),
    Speaker(id: '4', name: 'Giorgio Natili ', topic: 'Mutation Testing at Scale', rating: 4),
    Speaker(id: '5', name: 'Светлана Смельчакова', topic: 'UI Automator deep diving'),
    Speaker(
        id: '6',
        name: 'Виталий Фридман',
        topic: 'How to win friends and influence people, on mobile'),
    Speaker(
        id: '7',
        name: 'Борис Бенгус',
        topic: 'Воспроизводимость End-to-end тестов, или «Ходим под себя»'),
    Speaker(
        id: '8',
        name: 'Александр Сорокин',
        topic: 'Как происходит рендеринг экрана сообщений ВКонтакте'),
  ];

  @override
  Future<List<Speaker>> loadSpeakers() async {
    return _allSpeakers;
  }

  @override
  Future<void> saveSpeaker(Speaker speaker) async {
    //Here should be saving item to repository
    return;
  }
}
