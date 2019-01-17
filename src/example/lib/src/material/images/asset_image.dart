import 'dart:ui';
import 'package:flutter/material.dart';
import '../../scaffold_page.dart';


class AssetImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScaffoldPageWidget(
        title: 'asset image',
        child: Center(
          child: Image.asset('static/images/1.jpg'),
        )
    );
  }
}


