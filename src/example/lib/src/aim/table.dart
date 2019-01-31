import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../scaffold_page.dart';

class TableViewExample extends StatelessWidget {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'list with title',
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        controller: this.controller,
        child: new Table(
          border: new TableBorder.all(width: 1.0,color: Colors.red),
          children: List<TableRow>.filled(100, TableRow(
          children: <Widget>[
            new TableCell(
              child: new Center(
                child: new Text('设置1'),
              ),
            ),
            new TableCell(
              child: new Center(
                child: new Text('设置2'),
              ),
            ),
            new TableCell(
              child: new Center(
                child: new Text('设置3'),
              ),
            ),
            new TableCell(
              child: new Center(
                child: new Text('设置4'),
              ),
            ),
          ],
        ),)
      ),
      )
    );
  }
}


class TableView extends StatefulWidget {
  final ScrollController controller = ScrollController();

  @override
  State<StatefulWidget> createState() {
    return TableViewState();
  }
}


class TableViewState extends State<TableView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}


