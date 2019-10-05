
import 'package:rating_redux/models/filter.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final PopupMenuItemSelected<Filter> onSelected;
  final Filter activeFilter;
  final bool visible;

  FilterButton({this.onSelected, this.activeFilter, this.visible, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.body1;
    final activeStyle = Theme.of(context)
        .textTheme
        .body1
        .copyWith(color: Theme.of(context).accentColor);
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
  const _Button({
    Key key,
    @required this.onSelected,
    @required this.activeFilter,
    @required this.activeStyle,
    @required this.defaultStyle,
  }) : super(key: key);

  final PopupMenuItemSelected<Filter> onSelected;
  final Filter activeFilter;
  final TextStyle activeStyle;
  final TextStyle defaultStyle;

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
                style: activeFilter == Filter.all
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            PopupMenuItem<Filter>(
              value: Filter.top,
              child: Text(
                'Show top',
                style: activeFilter == Filter.top
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            PopupMenuItem<Filter>(
              value: Filter.unrated,
              child: Text(
                'Show unrated',
                style: activeFilter == Filter.unrated
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
          ],
      icon: Icon(Icons.filter_list),
    );
  }
}
