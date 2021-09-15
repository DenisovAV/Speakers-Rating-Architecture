import 'package:rating_bloc/blocs/speakers_bloc.dart';
import 'package:rating_bloc/blocs/talks_bloc.dart';
import 'package:rating_bloc/blocs/ui_bloc.dart';
import 'package:rating_bloc/widgets/home_screen.dart';
import 'package:rating_bloc/repository/speakers_repository.dart';
import 'package:rating_bloc/repository/talks_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(RatingBlocApp());

class RatingBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final speakersRepo = ConstSpeakersRepository();
    final talksRepo = ConstTalksRepository();
    final speakersBloc = SpeakersBloc(speakersRepo);
    final talksBloc = TalksBloc(talksRepo);
    return MaterialApp(
      title: 'Mobius Speakers',
      home: HomeScreen(() => UiBloc(speakersBloc, talksBloc)),
    );
  }
}
