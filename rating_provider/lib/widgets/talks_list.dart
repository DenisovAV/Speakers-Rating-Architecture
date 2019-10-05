import 'package:rating_provider/models/talk.dart';
import 'package:rating_provider/widgets/talk_item.dart';
import 'package:flutter/material.dart';

class TalksList extends StatelessWidget {
  final List<ScheduledTalk> talks;
  final Function(ScheduledTalk) onTalkTapped;

  TalksList(
      {Key key, @required this.talks, @required this.onTalkTapped})
      : super(key: key);

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
