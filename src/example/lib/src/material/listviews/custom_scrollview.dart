import 'package:flutter/material.dart';
import '../../scaffold_page.dart';

class CustomScrollViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollViewWidget(),
    );
  }
}

class CustomScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 350.0,
          primary: true,

          leading: BackButton(color: Colors.red,),
          actions: <Widget>[
            Text('action'),
          ],
          flexibleSpace: Center(child: ImageBackgroud(),),
        ),

        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ImageBackgroud extends StatelessWidget {
  const ImageBackgroud():super();

  @override
  Widget build(BuildContext context) {
    return Image.asset('static/images/1.jpg');
  }
}