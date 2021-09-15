import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_flutter_bloc/actions/actions.dart';
import 'package:rating_flutter_bloc/blocs/speakers_bloc.dart';
import 'package:rating_flutter_bloc/blocs/talks_bloc.dart';
import 'package:rating_flutter_bloc/blocs/ui_bloc.dart';
import 'package:rating_flutter_bloc/models/app_tab.dart';
import 'package:rating_flutter_bloc/models/filter.dart';
import 'package:rating_flutter_bloc/models/speaker.dart';
import 'package:rating_flutter_bloc/models/state/app_state.dart';
import 'package:rating_flutter_bloc/models/state/speakers_state.dart';
import 'package:rating_flutter_bloc/models/state/talks_state.dart';
import 'package:rating_flutter_bloc/widgets/filter_button.dart';
import 'package:rating_flutter_bloc/widgets/loading_indicator.dart';
import 'package:rating_flutter_bloc/widgets/speakers_list.dart';
import 'package:rating_flutter_bloc/widgets/talks_list.dart';
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
  Widget build(BuildContext context) => BlocBuilder<UiBloc, AppState>(
      builder: (context, uiState) => Scaffold(
          appBar: AppBar(
            title: Text('RatingBlocDemoApp'),
            actions: [
              FilterButton(
                visible: uiState.activeTab == AppTab.speakers,
                activeFilter: uiState.filter,
                onSelected: (filter) => context.read<UiBloc>().add(UpdateFilterAction(filter)),
              ),
            ],
          ),
          body: uiState.activeTab == AppTab.speakers
              ? BlocBuilder<SpeakersBloc, SpeakersState>(builder: (context, speakersState) {
                  if (speakersState.isLoading) {
                    return LoadingIndicator();
                  }
                  return SpeakerList(
                    speakers: _filteredSpeakers(speakersState.speakers, uiState.filter),
                    ratingChanged: (speaker, rating) => context
                        .read<SpeakersBloc>()
                        .add(UpdateSpeakerAction(speaker.copyWith(rating: rating))),
                  );
                })
              : BlocBuilder<TalksBloc, TalksState>(builder: (context, talksState) {
                  if (talksState.isLoading) {
                    return LoadingIndicator();
                  }
                  return TalksList(
                    talks: talksState.talks,
                    onTalkTapped: (talk) => context
                        .read<TalksBloc>()
                        .add(UpdateTalkAction(talk.copyWith(isFavourite: !talk.isFavourite))),
                  );
                }),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: AppTab.values.indexOf(uiState.activeTab),
            onTap: (index) => context.read<UiBloc>().add(UpdateTabAction(AppTab.values[index])),
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
