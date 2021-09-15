import 'package:flutter/material.dart';
import 'package:rating_mobx/models/speaker.dart';
import 'package:rating_mobx/widgets/speaker_details.dart';
import 'package:rating_mobx/widgets/speaker_item.dart';

class SpeakerList extends StatelessWidget {
  final List<Speaker> speakers;
  final Function(Speaker, int) ratingChanged;

  SpeakerList({
    required this.speakers,
    required this.ratingChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: speakers.length,
      itemBuilder: (BuildContext context, int index) {
        final speaker = speakers[index];

        return SpeakerItem(
          speaker: speaker,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailsScreen(
              speaker: speaker,
              ratingChanged: (r) => ratingChanged(speaker, r),
            ),
          )),
        );
      },
    );
  }
}
