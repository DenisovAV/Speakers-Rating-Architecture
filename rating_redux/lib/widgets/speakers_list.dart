import 'package:rating_redux/containers/app_loading.dart';
import 'package:rating_redux/containers/speaker_details.dart';
import 'package:rating_redux/models/speaker.dart';
import 'package:rating_redux/widgets/loading_indicator.dart';
import 'package:rating_redux/widgets/speaker_item.dart';
import 'package:flutter/material.dart';

class SpeakerList extends StatelessWidget {
  final List<Speaker> speakers;

  SpeakerList({
    Key key,
    @required this.speakers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      AppLoading(builder: (context, loading) => loading ? LoadingIndicator() : _buildListView());

  ListView _buildListView() => ListView.builder(
        itemCount: speakers.length,
        itemBuilder: (BuildContext context, int index) {
          final speaker = speakers[index];
          return SpeakerItem(
            speaker: speaker,
            onTap: () => _onSpeakerTap(context, speaker),
          );
        },
      );

  void _onSpeakerTap(BuildContext context, Speaker speaker) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => SpeakerDetails(id: speaker.id),
    ));
  }
}
