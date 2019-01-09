import 'package:flutter/material.dart';
import 'scaffold_page.dart';

class ChipExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'chip',
      child: Builder(
        builder: (context){
          return Container(
            width: double.infinity,
            child: Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),
              label: Text('Aaron Burr'),
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
              ),
              deleteIcon: Icon(
                Icons.android,
                size: 20.0,
              ),
              onDeleted: (){
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('delete'))
                );
              },
            ),
          );
        }
      )
    );
  }
}