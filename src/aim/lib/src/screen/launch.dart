import 'package:flutter/material.dart';
import 'container/launch.dart';
import '../app.dart';
import '../routes.dart';

class LaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LaunchContainer(
        onFinished: (delay){
          // delay for duration to home page
          Future.delayed(Duration(seconds: delay??0)).then((value){
            Navigator.of(context).pushReplacementNamed(Routes.home);
          });
        },
      )
    );
  }
}
