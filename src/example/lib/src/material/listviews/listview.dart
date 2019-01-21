import 'package:flutter/material.dart';


class ListViewExample extends StatefulWidget {
 @override
  State<StatefulWidget> createState() {
    return ListViewExampleState();
  }
}

class ListViewExampleState extends State<ListViewExample> {
  int _index = 0;
  List<Widget> _tabs = <Widget>[
    ItemList(),
    Center(child: Text('tab1'),),
    Center(child: Text('tab2'),)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('tab0')),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('tab1')),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('tab2')),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (index){
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  PageStorageKey _key = PageStorageKey<String>('tab0');
  @override
  State<StatefulWidget> createState() {
    return ItemListState();
  }
}


class ItemListState extends State<ItemList> {
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: widget._key,
      controller: _controller,
      itemCount: 100,
      itemExtent: 50,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text('$index'),
          title: Text('$index'),
          subtitle: Text('$index'),
          trailing: Text('$index'),
        );
      },
    );
  }
}

