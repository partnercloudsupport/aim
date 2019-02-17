import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../model/base.dart';
import '../../state/all.dart';
import '../../state/base.dart';
import '../../widget/basics.dart';


// redux page/widget loader
class DataContainer<DataModel extends DataState> extends StatefulWidget {
  // redux action object
  final dynamic action;
  // condition when to init action
  final bool Function(AppState) when;
  // app state selector
  final DataModel Function(AppState) select;
  // condition when to ignore state change
  final bool Function(AppState) ignore;
  // app state changed
  final void Function(dynamic) changed;
  // child builder
  final Widget Function(BuildContext, dynamic) builder;

  DataContainer({Key key, @required this.action, this.when, @required this.select, this.ignore, this.changed, @required this.builder}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DataContainerState<DataModel>();
  }
}

class _DataContainerState<DataModel extends DataState> extends State<DataContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DataModel>(
      onInit: (store) {
        if (this.widget.when!=null?this.widget.when(store.state):true && !this.widget.select(store.state).isUsable){
          store.dispatch(this.widget.action);
        }
      },
      converter: (store) {
        return this.widget.select(store.state);
      },
      ignoreChange: (state) {
        return this.widget.ignore!=null ? this.widget.ignore(state) : false;
      },
      onDidChange: (state) {
        if(this.widget.changed != null){
          this.widget.changed(state);
        }
      },
      builder: (context, state){
        if(state.isToLoad){
          return ToLoadIndicator(load: (){
            StoreProvider.of<AppState>(context).dispatch(this.widget.action);
          });
        } else if(state.isLoading){
          return LoadingIndicator();
        } else if(state.isFailed){
          return FailureIndicator(msg: state.tip, retry: (){
            StoreProvider.of<AppState>(context).dispatch(this.widget.action);
          });
        } else {
          return this.widget.builder(context, state);
        }
      },
    );
  }
}

// auto widget loader using redux state
class ViewContainer<ViewModel extends ViewState> extends StatefulWidget {
  // redux action object
  final dynamic action;
  // condition when to init action
  final bool Function(AppState) when;
  // app state selector
  final ViewModel Function(AppState) select;
  // child builder
  final Widget Function(BuildContext, ViewModel) builder;

  ViewContainer({Key key, @required this.action, this.when, @required this.select, @required this.builder}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ViewContainerState<ViewModel>();
  }
}

class _ViewContainerState<ViewModel extends ViewState> extends State<ViewContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      onInit: (store) {
        if(this.widget.when??this.widget.when(store.state)??true && this.widget.select(store.state).canLoad)
          store.dispatch(this.widget.action);
      },
      converter: (store) {
        return this.widget.select(store.state);
      },
      builder: (context, state){
        if(state.isToLoad){
          return ToLoadIndicator(load: (){
            StoreProvider.of<AppState>(context).dispatch(this.widget.action);
          });
        } else if(state.isLoading){
          return LoadingIndicator();
        } else if(state.isFailed){
          return FailureIndicator(msg: state.tip, retry: (){
            StoreProvider.of<AppState>(context).dispatch(this.widget.action);
          });
        } else {
          return this.widget.builder(context, state);
        }
      },
    );
  }
}
