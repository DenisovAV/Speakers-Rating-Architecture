import 'package:rating_bloc/blocs/speakers_bloc.dart';
import 'package:rating_bloc/widgets/home_screen.dart';
import 'package:rating_bloc/repository/speakers_repository.dart';
import 'package:rating_bloc/repository/talks_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(RatingBlocApp());

class RatingBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobius Speakers',
      home: HomeScreen(() => SpeakersBloc(ConstSpeakersRepository(), ConstTalksRepository())),
    );
  }
}
