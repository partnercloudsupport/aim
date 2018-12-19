import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../reduxs.dart';
import '../widgets.dart';


class HomeScreen extends StatelessWidget {
  // tab items
  final List<BottomNavigationBarItem> _tabItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('资讯')),
    BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('行情')),
    BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('自选')),
    BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('交易')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
  ];

  // home page tab option widgets
  final List<Widget> _tabWidgets = <Widget>[
    NewsWidget(),
    MarketWidget(),
    SelfChoiceWidget(),
    TradeWidget(),
    MineWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store)=>store.state.tabIndex,
      builder: (context, index) {
        return Scaffold(
          body: _tabWidgets[index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _tabItems,
            currentIndex: index,
            onTap: (index){
              StoreProvider.of<AppState>(context).dispatch(ActionSwtichTab(index: index));
            },
          ),
        );
      }
    );
  }
}