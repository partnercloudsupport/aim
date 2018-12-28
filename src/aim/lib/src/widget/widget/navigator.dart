//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


Future push(BuildContext context, WidgetBuilder builder){
  Navigator.push(context, CupertinoPageRoute(builder: builder));
}

void pop(BuildContext context, result){
  Navigator.of(context).pop(result);
}