import 'package:flutter/material.dart';
import '../../scaffold_page.dart';

class LoadingIndicatorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'loading',
      child: Center(
        child: LoadingIndicatorWidget(),
      ),
    );
  }
}


class LoadingIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
