import 'package:rating_cubit/models/speaker.dart';
import 'package:rating_cubit/widgets/speaker_item.dart';
import 'package:rating_cubit/widgets/speaker_details.dart';
import 'package:flutter/material.dart';

class SpeakerList extends StatelessWidget {
  final List<Speaker> speakers;
  final Function(Speaker, int) ratingChanged;

  SpeakerList({
    Key key,
    @required this.speakers,
    @required this.ratingChanged,
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
