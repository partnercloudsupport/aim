import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../state/all.dart';
import '../../state/app.dart';
import '../../action/app.dart';

class HomeBodyContainer extends StatelessWidget {
  final List<Widget> pages;
  HomeBodyContainer({Key key, @required this.pages}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppTab>(
      converter: (store){
        return store.state.appTab;
      },
      builder: (context, appTab){
        return IndexedStack(
          index: appTab.index,
          children: this.pages,
        );
      },
    );
  }
}

class HomeNavContainer extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  HomeNavContainer({Key key, @required this.items}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppTab>(
      converter: (store){
        return store.state.appTab;
      },
      builder: (context, appTab){
        return BottomNavigationBar(
            items: this.items,
            type: BottomNavigationBarType.fixed,
            currentIndex: appTab.index,
            onTap: (index){
              StoreProvider.of<AppState>(context).dispatch(ActionChangeAppTab(AppTab.values[index]));
            },
        );
      },
    );
  }
}