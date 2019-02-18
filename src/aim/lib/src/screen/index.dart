import 'package:flutter/material.dart';
import 'container/index.dart';

class IndexDetailPage extends StatelessWidget {
  final String id;
  final String name;
  IndexDetailPage({Key key, @required this.id, @required this.name}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          centerTitle: true,
          title: Text(this.name??this.id??'--'),
        ),
        body: IndexDetailContainer(id: this.id)
    );
  }
}
