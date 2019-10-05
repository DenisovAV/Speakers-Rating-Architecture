import 'package:rating_redux/models/app_state.dart';
import 'package:rating_redux/reducers/filter_reducer.dart';
import 'package:rating_redux/reducers/loading_reducer.dart';
import 'package:rating_redux/reducers/speakers_reducer.dart';
import 'package:rating_redux/reducers/tabs_reducer.dart';
import 'package:rating_redux/reducers/talks_reducer.dart';


AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    speakers: speakersReducer(state.speakers, action),
    talks: talksReducer(state.talks, action),
    activeTab: tabsReducer(state.activeTab, action),
    filter: filterReducer(state.filter, action),
  );
}
