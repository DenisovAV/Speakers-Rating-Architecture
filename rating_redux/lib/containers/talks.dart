import 'package:rating_redux/actions/actions.dart';
import 'package:rating_redux/models/app_state.dart';
import 'package:rating_redux/models/talk.dart';
import 'package:rating_redux/widgets/talks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Talks extends StatelessWidget {
  Talks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return TalksList(
          talks: vm.talks,
          onTalkTapped: vm.onCheckboxChanged,
        );
      },
    );
  }
}

class _ViewModel {
  final List<ScheduledTalk> talks;
  final Function(ScheduledTalk) onCheckboxChanged;
  final bool loading;

  _ViewModel({
    required this.talks,
    required this.loading,
    required this.onCheckboxChanged,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        talks: store.state.talks,
        loading: store.state.isLoading,
        onCheckboxChanged: (talk) {
          store.dispatch(UpdateTalkAction(
            talk.id,
            talk.copyWith(isFavourite: !talk.isFavourite),
          ));
        },
      );
}
