import 'package:rating_redux/containers/active_tab.dart';
import 'package:rating_redux/containers/filter_selector.dart';
import 'package:rating_redux/containers/filtered_speakers.dart';
import 'package:rating_redux/containers/tab_selector.dart';
import 'package:rating_redux/containers/talks.dart';
import 'package:rating_redux/models/app_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onInit;

  HomeScreen({
    required this.onInit,
    Key? key,
  });

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ActiveTab(
      builder: (BuildContext context, AppTab activeTab) => Scaffold(
            appBar: AppBar(
              title: Text('RatingReduxDemoApp'),
              actions: [
                FilterSelector(visible: activeTab == AppTab.speakers),
              ],
            ),
            body: activeTab == AppTab.speakers ? FilteredSpeakers() : Talks(),
            bottomNavigationBar: TabSelector(),
          ));
}
