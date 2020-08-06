import 'package:rating_cubit/models/state/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_cubit/models/app_tab.dart';
import 'package:rating_cubit/models/filter.dart';

class UiCubit extends Cubit<AppState> {
  UiCubit() : super(AppState());

  void updateTab(AppTab newTab) {
    emit(state.copyWith(activeTab: newTab));
  }

  void updateFilter(Filter newFilter) {
    emit(state.copyWith(filter: newFilter));
  }
}
