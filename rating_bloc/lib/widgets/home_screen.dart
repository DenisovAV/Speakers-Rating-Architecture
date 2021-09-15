import 'package:rating_bloc/actions/actions.dart';
import 'package:rating_bloc/blocs/ui_bloc.dart';
import 'package:rating_bloc/models/app_tab.dart';
import 'package:rating_bloc/models/filter.dart';
import 'package:rating_bloc/models/speaker.dart';
import 'package:rating_bloc/models/state/app_state.dart';
import 'package:rating_bloc/widgets/filter_button.dart';
import 'package:rating_bloc/widgets/loading_indicator.dart';
import 'package:rating_bloc/widgets/speakers_list.dart';
import 'package:rating_bloc/widgets/talks_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Function _blocBuilder;

  HomeScreen(this._blocBuilder);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  late final UiBloc _bloc;

  @override
  void initState() {
    _bloc = widget._blocBuilder();
    _bloc.action.add(LoadSpeakersAction());
    _bloc.action.add(LoadTalksAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<AppState>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingIndicator();
        } else {
          return Scaffold(
              appBar: AppBar(
                title: Text('RatingBlocDemoApp'),
                actions: [
                  FilterButton(
                    visible: snapshot.data?.activeTab == AppTab.speakers,
                    activeFilter: snapshot.data?.speakersState.filter ?? Filter.all,
                    onSelected: (filter) => _bloc.action.add(UpdateFilterAction(filter)),
                  ),
                ],
              ),
              body: snapshot.data?.activeTab == AppTab.speakers
                  ? SpeakerList(
                      speakers: _filteredSpeakers(snapshot.data?.speakersState.speakers ?? [],
                          snapshot.data?.speakersState.filter ?? Filter.all),
                      ratingChanged: (speaker, rating) =>
                          _bloc.action.add(UpdateSpeakerAction(speaker.copyWith(rating: rating))),
                    )
                  : TalksList(
                      talks: snapshot.data?.talksState.talks ?? [],
                      onTalkTapped: (talk) => _bloc.action
                          .add(UpdateTalkAction(talk.copyWith(isFavourite: !talk.isFavourite))),
                    ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: AppTab.values.indexOf(snapshot.data?.activeTab ?? AppTab.speakers),
                onTap: (index) => _bloc.action.add(UpdateTabAction(AppTab.values[index])),
                items: AppTab.values.map((tab) {
                  return BottomNavigationBarItem(
                    icon: Icon(
                      tab == AppTab.speakers ? Icons.group : Icons.list,
                    ),
                    label: tab == AppTab.speakers ? 'Speakers' : 'Schedule',
                  );
                }).toList(),
              ));
        }
      });

  List<Speaker> _filteredSpeakers(List<Speaker> speakers, Filter filter) => speakers.where((s) {
        if (filter == Filter.top) {
          return s.rating == 5;
        } else if (filter == Filter.unrated) {
          return s.rating == null;
        } else {
          return true;
        }
      }).toList();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
