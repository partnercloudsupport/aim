import 'package:flutter/material.dart';
import 'news.dart';
import 'market.dart';
import 'trade.dart';
import 'mine.dart';
import 'container/home.dart';


class HomePage extends StatelessWidget {
  // home pages
  final List<Widget> pages = [ NewsHomePage(), MarketHomePage(), TradeHomePage(), MineHomePage() ];

  // nav bar items for home pages
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('资讯')),
    BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('行情')),
    BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('交易')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBodyContainer(pages: this.pages),
      bottomNavigationBar: HomeNavContainer(items: this.items),
    );
  }
}
