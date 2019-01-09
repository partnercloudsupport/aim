import 'package:flutter/material.dart';
import 'scaffold_page.dart';

class DividerExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'divider',
      child: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: 20.0,
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                'asdd'
              ),
            ),
            VerticalDivider(
              width: 3.0,
              color: Colors.red,
            ),
            Container(
              child: Text(
                'asdsd'
              ),
            )
          ],
        ),
      )
    );
  }
}