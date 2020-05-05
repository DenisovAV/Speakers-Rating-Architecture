import 'package:rating_bloc/models/talk.dart';
import 'package:flutter/material.dart';

class TalkItem extends StatelessWidget {
  final Function onTalkTapped;
  final ScheduledTalk talk;

  TalkItem({
    @required this.onTalkTapped,
    @required this.talk,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        talk.time,
        style: Theme.of(context).textTheme.body1,
      ),
      trailing: IconButton(
          icon: Icon(talk.isFavourite ? Icons.check_circle : Icons.check_circle_outline),
          onPressed: onTalkTapped),
      title: Hero(
        tag: '_tag${talk.id}_',
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            talk.topic,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      subtitle: Text(
        talk.speaker?.name ?? '',
        style: Theme.of(context).textTheme.subhead,
      ),
    );
  }
}
