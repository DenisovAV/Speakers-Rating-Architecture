import 'package:provider/provider.dart';
import 'package:rating_mobx/observables/rating_observable.dart';
import 'package:rating_mobx/widgets/home_screen.dart';
import 'package:rating_mobx/repository/speakers_repository.dart';
import 'package:rating_mobx/repository/talks_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(RatingMobXApp());

class RatingMobXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => RatingState(ConstSpeakersRepository(), ConstTalksRepository()),
          )
        ],
        child: MaterialApp(
          title: 'Mobius Speakers',
          home: HomeScreen(),
        ));
  }
}
