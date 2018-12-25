import 'package:flutter/material.dart';

class Pair<K, V>{
  final K name;
  final V value;
  Pair(this.name, this.value);
}

class IndicatorExamplePage extends StatelessWidget {
  List<Pair> _indicators = [
    Pair('refresh indicator', RefreshIndicatorExamplePage()),
    Pair('refresh progress indicator', RefreshProgressIndicatorExamplePage()),
    Pair('circular progress indicator', CircularProgressIndicatorExamplePage()),
    Pair('linear progress indicator', LinearProgressIndicatorExamplePage()),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(onPressed: (){Navigator.pop(context);}, child: Icon(Icons.arrow_back)),
        title: Text('indicator examples'),
      ),
      body: ListView.builder(
        itemCount: _indicators.length,
        itemBuilder: (context, index){
          return RaisedButton(
            child: Center(child: Text(_indicators[index].name),),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>_indicators[index].value));
            },
          );
        },
      ),
    );
  }
}


class RefreshIndicatorExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(onPressed: (){Navigator.pop(context);}, child: Icon(Icons.arrow_back)),
        title: Text('refresh indicator'),
      ),
      body: RefreshIndicator(
        child: ListView(
          children: <Widget>[
            Center(child: Text('item1'),)
          ],
        ),
        onRefresh: (){
          print('refresh indicator: onRefresh.');
        },
        color: Colors.red,
        backgroundColor: Colors.grey,
        semanticsLabel: 'semantics label',
        semanticsValue: 'semantics value',

      ),
    );
  }
}

class RefreshProgressIndicatorExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(onPressed: (){Navigator.pop(context);}, child: Icon(Icons.arrow_back)),
        title: Text('refresh progress indicator'),
      ),
      body: Center(
        child: RefreshProgressIndicator(
          value: 1.0,
          strokeWidth: 4.0,
        ),
      )
    );
  }
}

class CircularProgressIndicatorExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: FlatButton(onPressed: (){Navigator.pop(context);}, child: Icon(Icons.arrow_back)),
          title: Text('circular progress indicator'),
        ),
        body: Center(
          child: CircularProgressIndicator(
          ),
        )
    );
  }
}

class LinearProgressIndicatorExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: FlatButton(onPressed: (){Navigator.pop(context);}, child: Icon(Icons.arrow_back)),
          title: Text('circular progress indicator'),
        ),
        body: Center(
          child: LinearProgressIndicator(
          ),
        )
    );
  }
}