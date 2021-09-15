import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rating_riverpod/providers/state_provider.dart';
import 'package:rating_riverpod/widgets/speaker_item.dart';
import 'package:rating_riverpod/widgets/speaker_details.dart';
import 'package:flutter/material.dart';

class SpeakerList extends ConsumerWidget {
  SpeakerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final speakers = watch(filteredSpeakersProvider);
    final speakersController = watch(speakersProvider.notifier);
    return ListView.builder(
      itemCount: speakers.length,
      itemBuilder: (BuildContext context, int index) {
        final speaker = speakers[index];

        return SpeakerItem(
          speaker: speaker,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailsScreen(
              speaker: speaker,
              ratingChanged: (r) => speakersController.updateSpeaker(speaker.copyWith(rating: r)),
            ),
          )),
        );
      },
    );
  }
}
