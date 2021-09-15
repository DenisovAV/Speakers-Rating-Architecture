import 'package:flutter/material.dart';
import 'package:rating_redux/models/talk.dart';

class TalkItem extends StatelessWidget {
  final VoidCallback onTalkTapped;
  final ScheduledTalk talk;

  TalkItem({
    required this.onTalkTapped,
    required this.talk,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        talk.time,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: IconButton(
          icon: Icon(talk.isFavourite ? Icons.check_circle : Icons.check_circle_outline),
          onPressed: onTalkTapped
      ),
      title: Hero(
        tag: '_tag${talk.id}_',
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            talk.topic,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      subtitle: Text(
        talk.speaker,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
