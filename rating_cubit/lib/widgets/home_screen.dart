import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_cubit/cubits/speakers_cubit.dart';
import 'package:rating_cubit/cubits/talks_cubit.dart';
import 'package:rating_cubit/cubits/ui_cubit.dart';
import 'package:rating_cubit/models/app_tab.dart';
import 'package:rating_cubit/models/filter.dart';
import 'package:rating_cubit/models/speaker.dart';
import 'package:rating_cubit/models/state/app_state.dart';
import 'package:rating_cubit/models/state/speakers_state.dart';
import 'package:rating_cubit/models/state/talks_state.dart';
import 'package:rating_cubit/widgets/filter_button.dart';
import 'package:rating_cubit/widgets/loading_indicator.dart';
import 'package:rating_cubit/widgets/speakers_list.dart';
import 'package:rating_cubit/widgets/talks_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => BlocBuilder<UiCubit, AppState>(
      builder: (context, uiState) => Scaffold(
          appBar: AppBar(
            title: Text('RatingCubitDemoApp'),
            actions: [
              FilterButton(
                visible: uiState.activeTab == AppTab.speakers,
                activeFilter: uiState.filter,
                onSelected: (filter) => context.read<UiCubit>().updateFilter(filter),
              ),
            ],
          ),
          body: uiState.activeTab == AppTab.speakers
              ? BlocBuilder<SpeakersCubit, SpeakersState>(builder: (context, speakersState) {
                  if (speakersState.isLoading) {
                    return LoadingIndicator();
                  }
                  return SpeakerList(
                    speakers: _filteredSpeakers(speakersState.speakers, uiState.filter),
                    ratingChanged: (speaker, rating) => context
                        .read<SpeakersCubit>()
                        .updateSpeaker(speaker.copyWith(rating: rating)),
                  );
                })
              : BlocBuilder<TalksCubit, TalksState>(builder: (context, talksState) {
                  if (talksState.isLoading) {
                    return LoadingIndicator();
                  }
                  return TalksList(
                    talks: talksState.talks,
                    onTalkTapped: (talk) => context
                        .read<TalksCubit>()
                        .updateTalk(talk.copyWith(isFavourite: !talk.isFavourite)),
                  );
                }),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: AppTab.values.indexOf(uiState.activeTab),
            onTap: (index) => context.read<UiCubit>().updateTab(AppTab.values[index]),
            items: AppTab.values.map((tab) {
              return BottomNavigationBarItem(
                icon: Icon(
                  tab == AppTab.speakers ? Icons.group : Icons.list,
                ),
                label: tab == AppTab.speakers ? 'Speakers' : 'Schedule',
              );
            }).toList(),
          )));

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
