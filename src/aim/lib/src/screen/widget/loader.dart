import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../state/app.dart';
import '../../state/base.dart';
import '../../widget/basics.dart';


// redux page/widget loader
class ReduxLoader<Model extends StateBase> extends StatefulWidget {
  // redux action object
  final dynamic action;
  // app state selector
  final Model Function(AppState state) selector;
  // child builder
  final Widget Function(BuildContext, Model) builder;

  ReduxLoader({Key key, @required this.action, @required this.selector, @required this.builder}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReduxLoaderState<Model>();
  }
}

class _ReduxLoaderState<Model extends StateBase> extends State<ReduxLoader> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Model>(
      onInit: (store) {
        store.dispatch(this.widget.action);
      },
      converter: (store) {
        return this.widget.selector(store.state);
      },
      builder: (context, state){
        if(state.isTodo){
          return ToLoadIndicator(load: (){
            StoreProvider.of<AppState>(context).dispatch(this.widget.action);
          });
        } else if(state.isDoing){
          return LoadingIndicator();
        } else if(state.isFailed){
          return FailureIndicator(msg: state.error, retry: (){
            StoreProvider.of<AppState>(context).dispatch(this.widget.action);
          });
        } else {
          return this.widget.builder(context, state);
        }
      },
    );
  }
}
