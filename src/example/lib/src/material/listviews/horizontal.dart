import 'package:flutter/material.dart';
import '../../scaffold_page.dart';


class HorizontalListViewExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'horizontal',
      child: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        height: 20,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  'title',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 8,
              child: Container(
                color: Colors.green,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                          index.toString()
                      ),
                    );
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}