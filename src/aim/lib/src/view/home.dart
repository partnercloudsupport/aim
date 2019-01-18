import 'package:flutter/material.dart';

import 'news/home.dart';
import 'market/home.dart';
import 'trade/trade.dart';
import 'mine/mine.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // tab index
  int _index = 0;
  // tab widgets
  List<Widget> _tabs = [
    NewsHomePage(),
    MarketHomePage(),
    TradePage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('资讯')),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('行情')),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('交易')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
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