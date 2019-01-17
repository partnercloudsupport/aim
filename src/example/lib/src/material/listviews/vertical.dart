import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../scaffold_page.dart';


class VerticalListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'List View',
      child: _ListWidget(),
    );
  }
}


class _ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _ListTitle(),
          Expanded(
              child: _ListBody()
          )
        ],
      ),
    );
  }
}


class _ListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'title',
        style: TextStyle(
          color: Colors.red
        ),
      ),
    );
  }
}

class _ListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index){
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('value$index'),
          );
        },
      ),
    );
  }
}
