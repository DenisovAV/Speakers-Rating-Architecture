
import 'package:rating_riverpod/widgets/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

void main() => runApp(RatingProviderApp());

class RatingProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      title: 'Mobius Speakers',
      home: HomeScreen(),
    ));
  }
}
