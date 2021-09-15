import 'package:rating_flutter_bloc/models/app_tab.dart';
import 'package:rating_flutter_bloc/models/filter.dart';

class AppState {
  final Filter filter;
  final AppTab activeTab;

  const AppState({
    this.filter = Filter.all,
    this.activeTab = AppTab.speakers,
  });

  AppState copyWith({
    Filter? filter,
    AppTab? activeTab,
  }) {
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      filter: filter ?? this.filter,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          filter == other.filter &&
          activeTab == other.activeTab;

  @override
  int get hashCode => filter.hashCode ^ activeTab.hashCode;

  @override
  String toString() => 'AppState{filter: $filter, activeTab: $activeTab}';
}
