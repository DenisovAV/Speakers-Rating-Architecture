import 'package:rating_redux/models/speaker.dart';

abstract class SpeakersRepository {
  const SpeakersRepository();

  Future<List<Speaker>> loadSpeakers();

  Future saveSpeakers(List<Speaker> speakers);
}

class ConstSpeakersRepository extends SpeakersRepository {
  const ConstSpeakersRepository();

  static const _allSpeakers = <Speaker>[
    Speaker(0, 'Йонатан Левин', topic: 'Неизвестно', rating: 4),
    Speaker(1, 'Марина Плешкова',
        topic: 'Лайфхаки в работе с техподдержкой Google Play Store и App Store Connect',
        rating: 2),
    Speaker(2, 'Александр Денисов', topic: 'Flutter State Management Wars. BLoC vs Redux'),
    Speaker(4, 'Барух Садогурский',
        topic: 'Как правильно продать себя ради фана и профита', rating: 3),
    Speaker(3, 'Giorgio Natili', topic: 'Mutation Testing at Scale', rating: 4),
    Speaker(5, 'Светлана Смельчакова', topic: 'UI Automator deep diving'),
    Speaker(6, 'Виталий Фридман', topic: 'How to win friends and influence people, on mobile'),
    Speaker(7, 'Борис Бенгус', topic: 'Воспроизводимость End-to-end тестов, или «Ходим под себя»'),
    Speaker(8, 'Александр Сорокин', topic: 'Как происходит рендеринг экрана сообщений ВКонтакте'),
  ];

  @override
  Future<List<Speaker>> loadSpeakers() async {
    return _allSpeakers;
  }

  @override
  Future saveSpeakers(List<Speaker> speakers) {
    //Here should be saving item to repository
    return null;
  }
}
