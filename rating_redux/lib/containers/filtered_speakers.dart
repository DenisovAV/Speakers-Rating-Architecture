import 'package:rating_redux/models/app_state.dart';
import 'package:rating_redux/models/filter.dart';
import 'package:rating_redux/models/speaker.dart';
import 'package:rating_redux/widgets/speakers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FilteredSpeakers extends StatelessWidget {
  FilteredSpeakers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return SpeakerList(
          speakers: vm.speakers,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Speaker> speakers;
  final bool loading;

  _ViewModel({
    required this.speakers,
    required this.loading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      speakers: store.state.speakers.where((s) {
        if (store.state.filter == Filter.top) {
          return s.rating == 5;
        } else if (store.state.filter == Filter.unrated) {
          return s.rating == null;
        } else {
          return true;
        }
      }).toList(),
      loading: store.state.isLoading,
    );
  }
}
