// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RatingState on _RatingState, Store {
  Computed<bool>? _$isLoadedComputed;

  @override
  bool get isLoaded => (_$isLoadedComputed ??=
          Computed<bool>(() => super.isLoaded, name: '_RatingState.isLoaded'))
      .value;
  Computed<List<Speaker>>? _$filteredSpeakersComputed;

  @override
  List<Speaker> get filteredSpeakers => (_$filteredSpeakersComputed ??=
          Computed<List<Speaker>>(() => super.filteredSpeakers,
              name: '_RatingState.filteredSpeakers'))
      .value;

  final _$talksAtom = Atom(name: '_RatingState.talks');

  @override
  List<ScheduledTalk> get talks {
    _$talksAtom.reportRead();
    return super.talks;
  }

  @override
  set talks(List<ScheduledTalk> value) {
    _$talksAtom.reportWrite(value, super.talks, () {
      super.talks = value;
    });
  }

  final _$speakersAtom = Atom(name: '_RatingState.speakers');

  @override
  List<Speaker> get speakers {
    _$speakersAtom.reportRead();
    return super.speakers;
  }

  @override
  set speakers(List<Speaker> value) {
    _$speakersAtom.reportWrite(value, super.speakers, () {
      super.speakers = value;
    });
  }

  final _$activeFilterAtom = Atom(name: '_RatingState.activeFilter');

  @override
  Filter? get activeFilter {
    _$activeFilterAtom.reportRead();
    return super.activeFilter;
  }

  @override
  set activeFilter(Filter? value) {
    _$activeFilterAtom.reportWrite(value, super.activeFilter, () {
      super.activeFilter = value;
    });
  }

  final _$activeTabIndexAtom = Atom(name: '_RatingState.activeTabIndex');

  @override
  int get activeTabIndex {
    _$activeTabIndexAtom.reportRead();
    return super.activeTabIndex;
  }

  @override
  set activeTabIndex(int value) {
    _$activeTabIndexAtom.reportWrite(value, super.activeTabIndex, () {
      super.activeTabIndex = value;
    });
  }

  final _$_initSpeakersAsyncAction = AsyncAction('_RatingState._initSpeakers');

  @override
  Future<void> _initSpeakers() {
    return _$_initSpeakersAsyncAction.run(() => super._initSpeakers());
  }

  final _$_initTalksAsyncAction = AsyncAction('_RatingState._initTalks');

  @override
  Future<void> _initTalks() {
    return _$_initTalksAsyncAction.run(() => super._initTalks());
  }

  final _$_RatingStateActionController = ActionController(name: '_RatingState');

  @override
  void updateSpeaker(Speaker speaker) {
    final _$actionInfo = _$_RatingStateActionController.startAction(
        name: '_RatingState.updateSpeaker');
    try {
      return super.updateSpeaker(speaker);
    } finally {
      _$_RatingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTalk(ScheduledTalk talk) {
    final _$actionInfo = _$_RatingStateActionController.startAction(
        name: '_RatingState.updateTalk');
    try {
      return super.updateTalk(talk);
    } finally {
      _$_RatingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFilter(Filter filter) {
    final _$actionInfo = _$_RatingStateActionController.startAction(
        name: '_RatingState.updateFilter');
    try {
      return super.updateFilter(filter);
    } finally {
      _$_RatingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTab(int index) {
    final _$actionInfo = _$_RatingStateActionController.startAction(
        name: '_RatingState.updateTab');
    try {
      return super.updateTab(index);
    } finally {
      _$_RatingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
talks: ${talks},
speakers: ${speakers},
activeFilter: ${activeFilter},
activeTabIndex: ${activeTabIndex},
isLoaded: ${isLoaded},
filteredSpeakers: ${filteredSpeakers}
    ''';
  }
}
