import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rating_riverpod/models/app_tab.dart';
import 'package:rating_riverpod/models/filter.dart';
import 'package:rating_riverpod/models/speaker.dart';
import 'package:rating_riverpod/models/talk.dart';
import 'package:rating_riverpod/notifiers/notifiers.dart';
import 'package:rating_riverpod/repository/speakers_repository.dart';
import 'package:rating_riverpod/repository/talks_repository.dart';

final talksProvider = StateNotifierProvider<TalksNotifier, List<ScheduledTalk>>(
    (_) => TalksNotifier(ConstTalksRepository()));

final speakersProvider = StateNotifierProvider<SpeakersNotifier, List<Speaker>>(
    (_) => SpeakersNotifier(ConstSpeakersRepository()));

final filterProvider = StateProvider((_) => Filter.all);

final tabProvider = StateProvider((_) => AppTab.speakers);

final loadingProvider = Provider(
    (ref) => ref.watch(speakersProvider).isNotEmpty && ref.watch(talksProvider).isNotEmpty);

final filteredSpeakersProvider = Provider((ref) {
  final filter = ref.watch(filterProvider);
  final speakers = ref.watch(speakersProvider);

  return speakers.where((s) {
    switch (filter.state) {
      case Filter.top:
        return s.rating == 5;
      case Filter.unrated:
        return s.rating == null;
      case Filter.all:
      default:
        return true;
    }
  }).toList();
});

final listedTalksProvider = Provider((ref) => ref.watch(talksProvider));
