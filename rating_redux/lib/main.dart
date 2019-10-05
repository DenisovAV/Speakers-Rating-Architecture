import 'package:rating_redux/actions/actions.dart';
import 'package:rating_redux/models/app_state.dart';
import 'package:rating_redux/reducers/app_state_reducer.dart';
import 'package:rating_redux/middleware/store_middleware.dart';
import 'package:rating_redux/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(RatingReduxApp());

class RatingReduxApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Mobius Speakers',
          routes: {
            "/": (context) {
              return HomeScreen(
                  onInit: () {
                    StoreProvider.of<AppState>(context).dispatch(LoadSpeakersAction());
                    StoreProvider.of<AppState>(context).dispatch(LoadTalksAction());
                  });
            },
          }
        ));
  }
}
