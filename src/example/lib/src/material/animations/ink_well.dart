import 'package:flutter/material.dart';
import '../../scaffold_page.dart';


class InkWellExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'Ink Well',
      child: Center(
        child: Builder(
          builder: (context){
            return Container(
              child: InkWell(
                radius: 300,
                borderRadius: BorderRadius.circular(100),
                highlightColor: Colors.green,
                splashColor: Colors.blue,
                child: Container(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text('button'),
                  ),
                ),
                onTap: (){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('tapped'),));
                },
              ),
            );
          },
        )
      ),
    );
  }
}