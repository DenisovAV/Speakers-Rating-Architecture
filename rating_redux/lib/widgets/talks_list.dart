import 'package:rating_redux/containers/app_loading.dart';
import 'package:rating_redux/models/talk.dart';
import 'package:rating_redux/widgets/loading_indicator.dart';
import 'package:rating_redux/widgets/talk_item.dart';
import 'package:flutter/material.dart';

class TalksList extends StatelessWidget {
  final List<ScheduledTalk> talks;
  final Function(ScheduledTalk) onCheckboxChanged;

  TalksList({
    Key key,
    @required this.talks,
    @required this.onCheckboxChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, loading) {
      return loading ? LoadingIndicator() : _buildListView();
    });
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: talks.length,
      itemBuilder: (BuildContext context, int index) {
        final talk = talks[index];

        return TalkItem(
          talk: talk,
          onCheckboxChanged: () =>
            onCheckboxChanged(talk)
        );
      },
    );
  }
}
