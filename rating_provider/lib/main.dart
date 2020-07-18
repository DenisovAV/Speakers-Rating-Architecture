import 'package:provider/provider.dart';
import 'package:rating_provider/notifiers/rating_change_notifier.dart';
import 'package:rating_provider/widgets/home_screen.dart';
import 'package:rating_provider/repository/speakers_repository.dart';
import 'package:rating_provider/repository/talks_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(RatingProviderApp());

class RatingProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  RatingAppState(ConstSpeakersRepository(), ConstTalksRepository())),
        ],
        child: MaterialApp(
          title: 'Mobius Speakers',
          home: HomeScreen(),
        ));
  }
}
