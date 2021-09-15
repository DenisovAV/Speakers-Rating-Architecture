import 'package:flutter/material.dart';
import 'package:rating_riverpod/models/speaker.dart';
import 'package:rating_riverpod/utils/utils.dart';

class SpeakerItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Speaker speaker;

  SpeakerItem({
    required this.onTap,
    required this.speaker,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: AssetImage(speaker.assetName),
      ),
      trailing: _getIconWidget(speaker.rating ?? 0),
      title: Hero(
        tag: '_tag${speaker.id}_',
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            speaker.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      subtitle: Text(
        speaker.topic,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  Widget _getIconWidget(int rating) {
    final icon = Utils.getRatingIcon(rating);
    return icon != null
        ? IconButton(
            icon: icon,
            onPressed: () {},
          )
        : SizedBox.shrink();
  }
}
