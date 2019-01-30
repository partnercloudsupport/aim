import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../state/app.dart';
import '../state/apptab.dart';
import '../action/apptab.dart';

import 'package:aim/src/screen/news.dart';
import 'package:aim/src/screen/market.dart';
import 'package:aim/src/screen/trade.dart';
import 'package:aim/src/screen/mine.dart';


class HomePage extends StatelessWidget {
  // home pages
  final List<Widget> homePages = [ NewsPage(), MarketPage(), TradePage(), MinePage() ];

  // nav bar items for home pages
  final List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('资讯')),
    BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('行情')),
    BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('交易')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppTab>(
      converter: (store){
        return Selector.activeTab(store.state);
      },
      builder: (context, appTab){
        return Scaffold(
          body: IndexedStack(
            index: appTab.index,
            children: this.homePages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: this.navBarItems,
            type: BottomNavigationBarType.fixed,
            currentIndex: appTab.index,
            onTap: (index){
              StoreProvider.of<AppState>(context).dispatch(ActionChangeAppTab(AppTab.values[index]));
            },
          ),
        );
      },
    );
  }
}
