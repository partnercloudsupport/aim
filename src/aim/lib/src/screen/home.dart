import 'package:flutter/material.dart';

import 'package:aim/src/screen/news.dart';
import 'package:aim/src/screen/market.dart';
import 'package:aim/src/screen/trade.dart';
import 'package:aim/src/screen/mine.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // current tab index
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: this.index??0,
        children: <Widget>[
          NewsPage(),
          MarketPage(),
          TradePage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('资讯')),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('行情')),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('交易')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: this.index??0,
        onTap: (index){
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}
