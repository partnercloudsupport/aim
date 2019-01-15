import 'package:flutter/material.dart';
import '../../scaffold_page.dart';


class FlowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'Flow Layout',
      child: FlowLayoutWidgets(),
    );
  }
}


class FlowLayoutWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: MyFlowDelegate(),
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          child: Text('item1'),
        ),
        Container(
          alignment: Alignment.center,
          child: Text('item2'),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Text('item3'),
        ),
      ],
    );
  }
}


class MyFlowDelegate extends FlowDelegate {
 @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    print('should repaint');
    return true;
  }

  @override
 void paintChildren(FlowPaintingContext context){
   print(context.childCount);
   context.paintChild(0);
   context.paintChild(1, transform: Matrix4.rotationY(1.2));
   context.paintChild(2, transform: Matrix4.rotationX(0.3));
 }
}