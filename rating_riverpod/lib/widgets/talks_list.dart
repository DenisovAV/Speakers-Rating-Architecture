import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rating_riverpod/providers/state_provider.dart';
import 'package:rating_riverpod/widgets/talk_item.dart';
import 'package:flutter/material.dart';

class TalksList extends HookWidget {
  TalksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final talks = useProvider(listedTalksProvider);
    final talksController = useProvider(talksProvider.notifier);
    return ListView.builder(
      itemCount: talks.length,
      itemBuilder: (BuildContext context, int index) {
        final talk = talks[index];
        return TalkItem(
            talk: talk,
            onTalkTapped: () =>
                talksController.updateTalk(talk.copyWith(isFavourite: !talk.isFavourite)));
      },
    );
  }
}
