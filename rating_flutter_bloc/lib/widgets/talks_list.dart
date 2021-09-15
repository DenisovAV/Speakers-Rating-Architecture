import 'package:flutter/material.dart';
import 'package:rating_flutter_bloc/models/talk.dart';
import 'package:rating_flutter_bloc/widgets/talk_item.dart';


class TalksList extends StatelessWidget {
  final List<ScheduledTalk> talks;
  final Function(ScheduledTalk) onTalkTapped;

  TalksList({
    required this.talks,
    required this.onTalkTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: talks.length,
      itemBuilder: (BuildContext context, int index) {
        final talk = talks[index];
        return TalkItem(talk: talk, onTalkTapped: () => onTalkTapped(talk));
      },
    );
  }
}
