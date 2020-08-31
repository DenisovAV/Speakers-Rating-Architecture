import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rating_riverpod/models/app_tab.dart';
import 'package:rating_riverpod/providers/state_provider.dart';
import 'package:rating_riverpod/widgets/filter_button.dart';
import 'package:rating_riverpod/widgets/loading_indicator.dart';
import 'package:rating_riverpod/widgets/speakers_list.dart';
import 'package:rating_riverpod/widgets/talks_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends HookWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    final filter = useProvider(filterProvider);
    final tab = useProvider(tabProvider);
    final isLoaded = useProvider(loadingProvider);
    if (!isLoaded) {
      return LoadingIndicator();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('RatingRiverpodDemoApp'),
          actions: [
            FilterButton(
              visible: tab.state == AppTab.speakers,
              activeFilter: filter.state,
              onSelected: (f) => filter.state = f,
            ),
          ],
        ),
        body: tab.state == AppTab.speakers ? SpeakerList() : TalksList(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tab.state.index,
          onTap: (index) => tab.state = AppTab.values[index],
          items: AppTab.values.map((tab) {
            return BottomNavigationBarItem(
              icon: Icon(
                tab == AppTab.speakers ? Icons.group : Icons.list,
              ),
              title: Text(tab == AppTab.speakers ? 'Speakers' : 'Schedule'),
            );
          }).toList(),
        ),
      );
    }
  }
}
