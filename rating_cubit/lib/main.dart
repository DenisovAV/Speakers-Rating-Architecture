import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_cubit/cubits/speakers_cubit.dart';
import 'package:rating_cubit/cubits/talks_cubit.dart';
import 'package:rating_cubit/cubits/ui_cubit.dart';
import 'package:rating_cubit/widgets/home_screen.dart';
import 'package:rating_cubit/repository/speakers_repository.dart';
import 'package:rating_cubit/repository/talks_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(RatingCubitApp());

class RatingCubitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final speakersRepo = ConstSpeakersRepository();
    final talksRepo = ConstTalksRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpeakersCubit>(
          create: (_) => SpeakersCubit(speakersRepo)..loadSpeakers(),
        ),
        BlocProvider<TalksCubit>(
          create: (_) => TalksCubit(talksRepo)..loadTalks(),
        ),
        BlocProvider<UiCubit>(
          create: (_) => UiCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Mobius Speakers',
        home: HomeScreen(),
      ),
    );
  }
}
