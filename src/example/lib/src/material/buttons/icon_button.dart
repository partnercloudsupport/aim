import 'package:flutter/material.dart';
import '../../scaffold_page.dart';

class IconButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'icon button',
      child: IconButtonWidget(),
    );
  }
}


class IconButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: IconButton(
        icon: Icon(Icons.store),
        color: Colors.red,
        iconSize: 50.0,
        onPressed: () {
          print('icon button');
        },
      ),
    );
  }
}
