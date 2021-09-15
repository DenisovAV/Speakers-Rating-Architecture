import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_flutter_bloc/actions/actions.dart';
import 'package:rating_flutter_bloc/blocs/speakers_bloc.dart';
import 'package:rating_flutter_bloc/blocs/talks_bloc.dart';
import 'package:rating_flutter_bloc/blocs/ui_bloc.dart';
import 'package:rating_flutter_bloc/widgets/home_screen.dart';
import 'package:rating_flutter_bloc/repository/speakers_repository.dart';
import 'package:rating_flutter_bloc/repository/talks_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(RatingBlocApp());

class RatingBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final speakersRepo = ConstSpeakersRepository();
    final talksRepo = ConstTalksRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpeakersBloc>(
          create: (_) => SpeakersBloc(speakersRepo)..add(LoadSpeakersAction()),
        ),
        BlocProvider<TalksBloc>(
          create: (_) => TalksBloc(talksRepo)..add(LoadTalksAction()),
        ),
        BlocProvider<UiBloc>(
          create: (_) => UiBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Mobius Speakers',
        home: HomeScreen(),
      ),
    );
  }
}
