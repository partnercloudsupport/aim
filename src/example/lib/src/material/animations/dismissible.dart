import 'package:flutter/material.dart';
import '../../scaffold_page.dart';


class DismissibleExample extends StatelessWidget {
  final List<String> items = List<String>.generate(20, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'dismissible',
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return new Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: new Key(item),
            // We also need to provide a function that will tell our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              items.removeAt(index);

              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away
            background: new Container(color: Colors.red),
            secondaryBackground: Container(color: Colors.blue),
            child: new ListTile(title: new Text('$item')),
          );
        },
      ),
    );
  }
}