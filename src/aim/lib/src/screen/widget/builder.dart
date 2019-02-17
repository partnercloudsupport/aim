import 'package:flutter/material.dart';

import '../../state/base.dart';
import '../../widget/basics.dart';


/// load widget with state status
class StateBuilder<T extends DataState> extends StatelessWidget {
  // state object
  final T state;
  // load action
  final Function() action;
  // widget builder after load succeed
  final  Widget Function(BuildContext context, T state) builder;

  StateBuilder({Key key, @required this.state, @required this.action, @required this.builder}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if(this.state.isToLoad){
      return ToLoadIndicator(load: this.action);
    } else if(this.state.isLoading){
      return LoadingIndicator();
    } else if(this.state.isFailed){
      return FailureIndicator(msg: this.state.tip, retry: this.action);
    } else {
      return builder(context, this.state);
    }
  }
}
