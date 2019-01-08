import 'package:flutter/material.dart';

import 'news/news.dart';
import 'market/market.dart';
import 'choice/choice.dart';
import 'trade/trade.dart';
import 'mine/mine.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // current tab index
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Offstage(
            child: NewsPage(),
            offstage: _tabIndex!=0,
          ),
          Offstage(
            child: MarketPage(),
            offstage: _tabIndex!=1,
          ),
          Offstage(
            child: SelfChoicePage(),
            offstage: _tabIndex!=2,
          ),
          Offstage(
            child: TradePage(),
            offstage: _tabIndex!=3,
          ),
          Offstage(
            child: MinePage(),
            offstage: _tabIndex!=4,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('资讯')),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('行情')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('自选')),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('交易')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}