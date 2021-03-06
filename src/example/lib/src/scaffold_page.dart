import 'package:flutter/material.dart';


class ScaffoldPageWidget extends StatelessWidget{
  final String title;
  final Widget child;
  ScaffoldPageWidget({Key key, @required this.title, @required this.child}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: FlatButton(
        onPressed: ()=>Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      title: Text(this.title),
      ),
      body: this.child
    );
  }
}