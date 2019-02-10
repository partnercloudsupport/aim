import 'package:flutter/material.dart';
import '../../scaffold_page.dart';


class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'grid view',
      child: GridView.count(
        primary: true,
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 4,
        children:  List<Widget>.filled(9, Container(
            color: Colors.blue,
            alignment: Alignment.center,
            height: 40,
            margin: EdgeInsets.all(5),
            child: Text('hello'),
          )
        ),
        semanticChildCount: 8,
        childAspectRatio: 1.5,
      ),
    );
  }
}