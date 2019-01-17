import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../scaffold_page.dart';


class OfflineExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'Online/Offline',
      child: Center(
        child: Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Colors.grey,
                  child: Text('demo1'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ScaffoldPageWidget(
                        title: 'Demo1',
                        child: Demo1(),
                      );
                    }));
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Colors.green,
                  child: Text('demo2'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ScaffoldPageWidget(
                        title: 'Demo2',
                        child: Demo2(),
                      );
                    }));
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  color: Colors.blue,
                  child: Text('demo3'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ScaffoldPageWidget(
                        title: 'Demo3',
                        child: Demo3(),
                      );
                    }));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return Stack(
          fit: StackFit.expand,
          children: [
            child,
            Positioned(
              height: 32.0,
              left: 0.0,
              right: 0.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: connected
                      ? Text('ONLINE')
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('OFFLINE'),
                      SizedBox(width: 8.0),
                      SizedBox(
                        width: 12.0,
                        height: 12.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'There are no bottons to push :)',
          ),
          new Text(
            'Just turn off your internet.',
          ),
        ],
      ),
    );
  }
}


class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        if (connectivity == ConnectivityResult.none) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Text(
                "Oops, \n\nNow we are Offline!",
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'There are no bottons to push :)',
              ),
              new Text(
                'Just turn off your internet.',
              ),
            ],
          ),
        );
      },
    );
  }
}

class Demo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      debounceDuration: Duration.zero,
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        if (connectivity == ConnectivityResult.none) {
          return Container(
            color: Colors.white70,
            child: Center(
              child: Text(
                "Oops, \n\nWe experienced a Delayed Offline!",
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        }
        return child;
      },
      child: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
            new Text(
              'This one has a bit of a delay.',
            ),
          ],
        ),
      ),
    );
  }
}
