//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Nav {
  static Future push(BuildContext context, WidgetBuilder builder){
    Navigator.push(context, CupertinoPageRoute(builder: builder));
  }

  static void pop(BuildContext context, result){
    Navigator.of(context).pop(result);
  }
}
