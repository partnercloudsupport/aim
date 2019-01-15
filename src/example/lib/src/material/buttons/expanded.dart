import 'package:flutter/material.dart';
import '../../scaffold_page.dart';

class ExpandedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'expanded button',
      child: ExpandedButtonWidget(),
    );
  }
}


class ExpandedButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Center(
        child: Text('点击重试'),
      ),
      onPressed: (){
        print('pressed');
      },
    );
  }
}
