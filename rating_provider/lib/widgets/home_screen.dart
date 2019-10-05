import 'package:provider/provider.dart';
import 'package:rating_provider/models/app_tab.dart';
import 'package:rating_provider/models/filter.dart';
import 'package:rating_provider/models/speaker.dart';
import 'package:rating_provider/notifiers/rating_change_notifier.dart';
import 'package:rating_provider/widgets/filter_button.dart';
import 'package:rating_provider/widgets/loading_indicator.dart';
import 'package:rating_provider/widgets/speakers_list.dart';
import 'package:rating_provider/widgets/talks_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int activeTabIndex;
  Filter activeFilter;

  @override
  void initState() {
    activeTabIndex = AppTab.speakers.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RatingChangeNotifier>(builder: (context, state, child) {
      if (!state.isLoaded) {
        return LoadingIndicator();
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('RatingProviderDemoApp'),
            actions: [
              FilterButton(
                visible: activeTabIndex == AppTab.speakers.index,
                activeFilter: activeFilter,
                onSelected: (filter) => setState(() => activeFilter = filter),
              ),
            ],
          ),
          body: activeTabIndex == 0
              ? SpeakerList(
                  speakers: _filteredSpeakers(state.speakers, activeFilter),
                  ratingChanged: (speaker, rating) =>
                      state.updateSpeaker(speaker.copyWith(rating: rating)))
              : TalksList(
                  talks: state.talks,
                  onTalkTapped: (talk) =>
                      state.updateTalk(talk.copyWith(isFavourite: !talk.isFavourite)),
                ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: activeTabIndex,
            onTap: (index) => setState(() => activeTabIndex = index),
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
    });
  }

  List<Speaker> _filteredSpeakers(List<Speaker> speakers, Filter filter) => speakers.where((s) {
        if (filter == Filter.top) {
          return s.rating == 5;
        } else if (filter == Filter.unrated) {
          return s.rating == null;
        } else {
          return true;
        }
      }).toList();
}
