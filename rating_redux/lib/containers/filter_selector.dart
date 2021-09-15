import 'package:rating_redux/actions/actions.dart';
import 'package:rating_redux/models/app_state.dart';
import 'package:rating_redux/models/filter.dart';
import 'package:rating_redux/widgets/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FilterSelector extends StatelessWidget {
  final bool visible;

  FilterSelector({
    required this.visible,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return FilterButton(
            visible: visible,
            activeFilter: vm.activeFilter,
            onSelected: vm.onFilterSelected,
          );
        },
      );
}

class _ViewModel {
  final Function(Filter) onFilterSelected;
  final Filter activeFilter;

  _ViewModel({
    required this.onFilterSelected,
    required this.activeFilter,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onFilterSelected: (filter) {
        store.dispatch(UpdateFilterAction(filter));
      },
      activeFilter: store.state.filter,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel && runtimeType == other.runtimeType && activeFilter == other.activeFilter;

  @override
  int get hashCode => activeFilter.hashCode;
}
