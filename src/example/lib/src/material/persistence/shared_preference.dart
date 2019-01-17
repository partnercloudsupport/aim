import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../scaffold_page.dart';


class SharedPreferenceExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'shared preferences',
      child: Center(
        child: CounterWidget()
      ),
    );
  }
}


class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterWidgetState();
  }
}

class CounterWidgetState extends State<CounterWidget> {
  int counter = 0;
  SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
  }

  void initCounter() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      counter = preferences.getInt('counter')??0;
    });
    print(counter);
  }

  void increaseCounter() async {
    setState(() {
      counter++;
    });
    preferences.setInt('counter', counter);
  }

  void decreaseCounter() async {
    setState(() {
      counter--;
    });
    preferences.setInt('counter', counter);
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(counter!=null ? counter.toString() : '--'),
            ),
            Expanded(
              flex: 1,
              child: Wrap(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: RaisedButton(
                      child: Text('init'),
                      onPressed: () {
                        initCounter();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: RaisedButton(
                      child: Text('increase'),
                      onPressed: () {
                        increaseCounter();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: RaisedButton(
                      child: Text('decrease'),
                      onPressed: () {
                        decreaseCounter();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}