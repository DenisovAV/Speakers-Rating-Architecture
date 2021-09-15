import 'package:rating_redux/models/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppLoading extends StatelessWidget {
  final Widget Function(BuildContext context, bool isLoading) builder;

  AppLoading({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, bool>(
        distinct: true,
        converter: (Store<AppState> store) => store.state.isLoading,
        builder: builder,
      );
}
