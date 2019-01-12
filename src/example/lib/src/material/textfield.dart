import 'package:flutter/material.dart';
import '../scaffold_page.dart';

class TextFieldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
        title: 'ListTile',
        child: Builder(
          builder: (context) {
            return Container(
              child: TextField(
                controller: TextEditingController.fromValue(TextEditingValue(
                    text: 'text field',
                    selection: TextSelection.fromPosition(TextPosition(offset: 2)),
                    composing: TextRange.empty,)
                ),

                onTap: () {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('tabbed')));
                },
              )
            );
          }
        )
    );
  }
}
