import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rating_riverpod/models/app_tab.dart';
import 'package:rating_riverpod/models/filter.dart';
import 'package:rating_riverpod/notifiers/notifiers.dart';
import 'package:rating_riverpod/repository/speakers_repository.dart';
import 'package:rating_riverpod/repository/talks_repository.dart';

final talksProvider = StateNotifierProvider((_) => TalksNotifier(ConstTalksRepository()));

final speakersProvider = StateNotifierProvider((_) => SpeakersNotifier(ConstSpeakersRepository()));

final filterProvider = StateProvider((_) => Filter.all);

final tabProvider = StateProvider((_) => AppTab.speakers);

final loadingProvider = Provider((ref) =>
    ref.watch(speakersProvider.state).isNotEmpty && ref.watch(talksProvider.state).isNotEmpty);

final filteredSpeakersProvider = Provider((ref) {
  final filter = ref.watch(filterProvider);
  final speakers = ref.watch(speakersProvider.state);

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

final listedTalksProvider = Provider((ref) => ref.watch(talksProvider.state));
