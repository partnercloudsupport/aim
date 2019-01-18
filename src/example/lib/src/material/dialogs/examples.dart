import 'package:flutter/material.dart';
import 'alert_dialog.dart';
import 'about_dialog.dart';
import 'simple_dialog.dart';
import 'custom_dialog.dart';
import 'dialog.dart';

class DialogExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persistence Examples'),
      ),
      body: DialogsList()
    );
  }
}


class DialogsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyAlertDialog(),
        MyAboutDialog(),
        MySimpleDialog(),
        MyCustomDialog(),
        MyDialog(),
      ],
    );
  }
}