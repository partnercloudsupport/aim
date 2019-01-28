import 'package:flutter/material.dart';


class SearchButton extends StatelessWidget {
  final Function() onPressed;
  SearchButton({Key key, @required this.onPressed}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: Icon(
        Icons.search,
        size: 28,
        color: Theme.of(context).primaryIconTheme.color,
      ),
      label: Text(
        '搜索',
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).primaryIconTheme.color,
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
