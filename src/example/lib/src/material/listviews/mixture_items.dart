import 'package:flutter/material.dart';
import '../../scaffold_page.dart';

class MixtureItemsExample extends StatelessWidget {
  final List<ListItem> items = List<ListItem>.generate(
    1000,
    (i) => i % 6 == 0 ? new HeadingItem("Heading $i") : new MessageItem("Sender $i", "Message body $i"),
  );

  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'mixture items',
      child: new ListView.builder(
        // Let the ListView know how many items it needs to build
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens! We'll
        // convert each item into a Widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          if (item is HeadingItem) {
            return new ListTile(
              title: new Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is MessageItem) {
            return new ListTile(
              title: new Text(item.sender),
              subtitle: new Text(item.body),
            );
          }
        },
      ),
    );
  }
}

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
