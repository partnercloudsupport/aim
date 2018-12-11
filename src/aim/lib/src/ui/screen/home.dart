import 'package:flutter/material.dart';
import '../widget/news.dart';
import '../widget/market.dart';
import '../widget/choice.dart';
import '../widget/trade.dart';
import '../widget/mine.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}


class _HomeScreenState extends State<HomeScreen>{
  // current select tab index
  int _tabIndex = 0;

  // tab items
  List<BottomNavigationBarItem> _tabItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('资讯')),
    BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('行情')),
    BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('自选')),
    BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('交易')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
  ];

  // home page tab option widgets
  List<Widget> _tabWidgets = <Widget>[
    NewsWidget(),
    MarketWidget(),
    SelfChoiceWidget(),
    TradeWidget(),
    MineWidget()];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabWidgets[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _tabItems,
        currentIndex: _tabIndex,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _tabIndex = index;
    });
  }
}