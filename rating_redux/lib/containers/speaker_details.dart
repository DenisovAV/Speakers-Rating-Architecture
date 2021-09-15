import 'package:rating_redux/actions/actions.dart';
import 'package:rating_redux/models/app_state.dart';
import 'package:rating_redux/models/speaker.dart';
import 'package:rating_redux/widgets/speaker_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SpeakerDetails extends StatelessWidget {
  final String id;

  SpeakerDetails({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        ignoreChange: (state) => !state.speakers.any((s) => s.id == id),
        converter: (Store<AppState> store) {
          return _ViewModel.from(store, id);
        },
        builder: (context, vm) {
          return DetailsScreen(
            speaker: vm.speaker,
            ratingChanged: vm.ratingChanged,
          );
        },
      );
}

class _ViewModel {
  final Speaker speaker;
  final Function(int) ratingChanged;

  _ViewModel({
    required this.speaker,
    required this.ratingChanged,
  });

  factory _ViewModel.from(Store<AppState> store, String id) {
    final speaker = store.state.speakers.firstWhere((s) => s.id == id);

    return _ViewModel(
      speaker: speaker,
      ratingChanged: (rating) {
        store.dispatch(UpdateSpeakerAction(
          speaker.id,
          speaker.copyWith(rating: rating),
        ));
      },
    );
  }
}
