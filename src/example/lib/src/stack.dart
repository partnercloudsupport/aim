import 'package:flutter/material.dart';


class StackExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          onPressed: ()=>Navigator.pop(context), 
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('stack example'),
      ),
      body: Stack(
        fit: StackFit.loose,
        alignment: AlignmentDirectional.topStart,
        overflow: Overflow.clip,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Image.network('http://attimg.dospy.com/img/day_091026/20091026_923f4ba80ea904d327daVyCBNVvKcye2.png'),
          Text(
            '这是一个Stack控件的测试用例',
            style: TextStyle(
              color: Colors.red
            ),
          ),
          Icon(
            Icons.store,
            color: Colors.red,
            size: 35.0,
          ),
        ],
      ),
    );
  }
}