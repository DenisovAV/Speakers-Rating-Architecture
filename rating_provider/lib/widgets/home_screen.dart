import 'package:provider/provider.dart';
import 'package:rating_provider/models/app_tab.dart';
import 'package:rating_provider/models/filter.dart';
import 'package:rating_provider/notifiers/rating_change_notifier.dart';
import 'package:rating_provider/widgets/filter_button.dart';
import 'package:rating_provider/widgets/loading_indicator.dart';
import 'package:rating_provider/widgets/speakers_list.dart';
import 'package:rating_provider/widgets/talks_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Consumer<RatingAppState>(builder: (context, state, child) {
      if (!state.isLoaded) {
        return LoadingIndicator();
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('RatingProviderDemoApp'),
            actions: [
              FilterButton(
                visible: state.activeTabIndex == AppTab.speakers.index,
                activeFilter: state.activeFilter ?? Filter.all,
                onSelected: state.updateFilter,
              ),
            ],
          ),
          body: state.activeTabIndex == AppTab.speakers.index
              ? SpeakerList(
                  speakers: state.filteredSpeakers,
                  ratingChanged: (speaker, rating) =>
                      state.updateSpeaker(speaker.copyWith(rating: rating)))
              : TalksList(
                  talks: state.talks,
                  onTalkTapped: (talk) =>
                      state.updateTalk(talk.copyWith(isFavourite: !talk.isFavourite)),
                ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.activeTabIndex,
            onTap: state.updateTab,
            items: AppTab.values.map((tab) {
              return BottomNavigationBarItem(
                icon: Icon(
                  tab == AppTab.speakers ? Icons.group : Icons.list,
                ),
                label: tab == AppTab.speakers ? 'Speakers' : 'Schedule',
              );
            }).toList(),
          ),
        );
      }
    });
  }
}
