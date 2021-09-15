import 'package:flutter/material.dart';
import 'package:rating_redux/containers/speaker_details.dart';
import 'package:rating_redux/models/speaker.dart';
import 'package:rating_redux/widgets/speaker_details.dart';
import 'package:rating_redux/widgets/speaker_item.dart';

class SpeakerList extends StatelessWidget {
  final List<Speaker> speakers;

  SpeakerList({
    required this.speakers,
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
            builder: (_) => SpeakerDetails(
              id: speaker.id,
            ),
          )),
        );
      },
    );
  }
}
