import 'package:flutter/material.dart';
import '../scaffold_page.dart';


class ContainerExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'Container',
      child: Container(
        alignment: Alignment.center,
        child: ContainerExampleWidget(),
      )
    );
  }
}

class ContainerExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: ShapeDecoration(
        color: Colors.green,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10))
        )
      ),
      //color: Colors.red,
    );
  }
}
