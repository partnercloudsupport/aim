import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'theme.dart';
import 'src/stack.dart';
import 'src/push_to_refresh.dart';
import 'src/offstage.dart';
import 'src/indicator.dart';
import 'src/webview.dart';
import 'src/flutter_html_view.dart';
import 'src/flutter_html.dart';
import 'src/http_loader.dart';
import 'src/container.dart';
import 'src/button.dart';
import 'src/card.dart';
import 'src/aim/widgets.dart';
import 'src/chip.dart';
import 'src/divider.dart';
import 'src/material/examples.dart';
import 'src/redux/state.dart';
import 'src/redux/reducer.dart';
import 'src/redux/middleware.dart';
import 'src/redux/view/examples.dart';

void main() => runApp(MyExampleApp());


class MyExampleApp extends StatelessWidget {

  final Store<AppState> store = Store<AppState>(appReducer, initialState: AppState(), middleware: appMiddleware);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: this.store,
      child: MaterialApp(
          home: HomePageWidget(),
          theme: AimTheme.theme1
      ),
    );
  }
}

class Example {
  final String name;
  final Widget widget;
  Example(this.name, this.widget);
}

class HomePageWidget extends StatelessWidget {
  List<Example> _examples = [
    Example('Aim', AimExamples()),
    Example('Material', MaterialExamples()),
    Example('Redux', ReduxExamples()),
    Example('Divider', DividerExampleWidget()),
    Example('Chip', ChipExampleWidget()),
    Example('Stack', StackExamplePage()),
    Example('PullToRefresh', PushToRefreshExamplePage()),
    Example('OffStage', OffstageExamplePage()),
    Example('Indicator', IndicatorExamplePage()),
    Example('WebView', WebViewExamplePage()),
    Example('FlutterHtmlView', FlutterHtmlViewExamplePage()),
    Example('FlutterHtml', FlutterHtmlExamplePage()),
    Example('HttpLoader', HttpLoaderWidget(url: '')),
    Example('Container', ContainerExampleWidget()),
    Example('Button', ButtonExampleWidget(),),
    Example('Card', CardExamples()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Examples'),
      ),
      body: ListView.builder(
        itemCount: _examples.length,
        itemBuilder: (context, index) {
          return RaisedButton(
            onPressed: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>_examples[index].widget));
            }, 
            child: Text(_examples[index].name),
            padding: EdgeInsets.all(4.0),
          );
        },
      ),
    );
  }
}
