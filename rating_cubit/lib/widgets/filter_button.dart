import 'package:flutter/material.dart';
import 'package:rating_cubit/models/filter.dart';

class FilterButton extends StatelessWidget {
  final PopupMenuItemSelected<Filter> onSelected;
  final Filter activeFilter;
  final bool visible;

  FilterButton(
      {required this.onSelected, required this.activeFilter, required this.visible, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.bodyText1;
    final activeStyle =
    Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).indicatorColor);
    final button = _Button(
      onSelected: onSelected,
      activeFilter: activeFilter,
      activeStyle: activeStyle,
      defaultStyle: defaultStyle,
    );

    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 150),
      child: visible ? button : IgnorePointer(child: button),
    );
  }
}

class _Button extends StatelessWidget {
  final PopupMenuItemSelected<Filter> onSelected;
  final Filter activeFilter;
  final TextStyle? activeStyle;
  final TextStyle? defaultStyle;

  const _Button({
    required this.onSelected,
    required this.activeFilter,
    this.activeStyle,
    this.defaultStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Filter>(
      tooltip: 'Speakers filters',
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuItem<Filter>>[
        PopupMenuItem<Filter>(
          value: Filter.all,
          child: Text(
            'Show all',
            style: activeFilter == Filter.all ? activeStyle : defaultStyle,
          ),
        ),
        PopupMenuItem<Filter>(
          value: Filter.top,
          child: Text(
            'Show top',
            style: activeFilter == Filter.top ? activeStyle : defaultStyle,
          ),
        ),
        PopupMenuItem<Filter>(
          value: Filter.unrated,
          child: Text(
            'Show unrated',
            style: activeFilter == Filter.unrated ? activeStyle : defaultStyle,
          ),
        ),
      ],
      icon: Icon(Icons.filter_list),
    );
  }
}
