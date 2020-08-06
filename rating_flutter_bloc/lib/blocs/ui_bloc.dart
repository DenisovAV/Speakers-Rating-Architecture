import 'dart:async';

import 'package:rating_flutter_bloc/actions/actions.dart';
import 'package:rating_flutter_bloc/models/state/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UiBloc extends Bloc<Action, AppState> {
  UiBloc() : super(AppState());

  @override
  Stream<AppState> mapEventToState(Action action) async* {
    if (action is UpdateTabAction) {
      yield state.copyWith(activeTab: action.newTab);
    } else if (action is UpdateFilterAction) {
      yield state.copyWith(filter: action.newFilter);
    }
  }
}
