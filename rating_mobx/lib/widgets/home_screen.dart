import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rating_mobx/models/app_tab.dart';
import 'package:rating_mobx/models/filter.dart';
import 'package:rating_mobx/observables/rating_observable.dart';
import 'package:rating_mobx/widgets/filter_button.dart';
import 'package:rating_mobx/widgets/loading_indicator.dart';
import 'package:rating_mobx/widgets/speakers_list.dart';
import 'package:rating_mobx/widgets/talks_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RatingState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('RatingMobXDemoApp'),
        actions: [
          Observer(
              builder: (context) => FilterButton(
                    visible: state.activeTabIndex == AppTab.speakers.index,
                    activeFilter: state.activeFilter ?? Filter.all,
                    onSelected: state.updateFilter,
                  )),
        ],
      ),
      body: Observer(
          builder: (context) => !state.isLoaded
              ? LoadingIndicator()
              : state.activeTabIndex == AppTab.speakers.index
                  ? SpeakerList(
                      speakers: state.filteredSpeakers,
                      ratingChanged: (speaker, rating) =>
                          state.updateSpeaker(speaker.copyWith(rating: rating)))
                  : TalksList(
                      talks: state.talks,
                      onTalkTapped: (talk) =>
                          state.updateTalk(talk.copyWith(isFavourite: !talk.isFavourite)),
                    )),
      bottomNavigationBar: Observer(
          builder: (context) => BottomNavigationBar(
                currentIndex: state.activeTabIndex,
                onTap: state.updateTab,
                items: AppTab.values.map((tab) {
                  return BottomNavigationBarItem(
                    icon: Icon(
                      tab == AppTab.speakers ? Icons.group : Icons.list,
                    ),
                    title: Text(tab == AppTab.speakers ? 'Speakers' : 'Schedule'),
                  );
                }).toList(),
              )),
    );
  }
}
