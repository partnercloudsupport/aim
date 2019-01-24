import 'package:flutter/material.dart';


void showError(BuildContext context, String msg){
  Scaffold.of(context).showSnackBar(
      SnackBar(
          content: Text(msg)
      )
  );
}