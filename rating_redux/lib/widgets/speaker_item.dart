import 'package:rating_redux/models/speaker.dart';
import 'package:rating_redux/utils/utils.dart';
import 'package:flutter/material.dart';

class SpeakerItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Speaker speaker;

  SpeakerItem({
    @required this.onTap,
    @required this.speaker,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: AssetImage(speaker.assetName),
      ),
      trailing: _getIconWidget(speaker.rating),
      title: Hero(
        tag: '_tag${speaker.id}_',
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            speaker.name,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      subtitle: Text(
        speaker.topic,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subhead,
      ),
    );
  }

  Widget _getIconWidget(int rating) {
    return (rating != null)
        ? IconButton(icon: Utils.getRatingIcon(rating), onPressed: (){},)
        : Container(
            width: 0,
          );
  }
}
