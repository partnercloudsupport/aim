import 'package:flutter/widgets.dart';
import '../../scaffold_page.dart';


class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'grid view',
      child: GridView.count(
        primary: true,
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 2,
        children:  <Widget>[
          Center(child: Text('hello1',)),
          Text('hello1', textAlign: TextAlign.right,),
          Text('hello1'),
          Text('hello1'),
          Text('hello1'),
        ],
      ),
    );
  }
}