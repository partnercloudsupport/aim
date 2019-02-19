import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../model/base.dart';
import '../../state/all.dart';
import '../../state/base.dart';
import '../../widget/basics.dart';


// redux container with data model
class DataContainer<DataModel extends DataState> extends StatelessWidget {
  // on init widget
  final void Function(Store<AppState>) init;
  // on select view model
  final void Function(Store<AppState>) select;
  // on widget dispose
  final void Function(Store<AppState>) dispose;
  // on build child widget
  final Widget Function(BuildContext, DataModel) builder;

  DataContainer({Key key, this.init, @required this.select, this.dispose, @required this.builder}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DataModel>(
      onInit: this.init,
      converter: this.select,
      onDispose: this.dispose,
      builder: (context, model){
        if(model.isToLoad){
          return ToLoadIndicator(
              load: () {
                if(this.init != null){
                  this.init(StoreProvider.of<AppState>(context));
                }
              }
          );
        } else if(model.isLoading){
          return LoadingIndicator();
        } else if(model.isFailed){
          return FailureIndicator(
              msg: model.tip,
              retry: () {
                if(this.init != null){
                  this.init(StoreProvider.of<AppState>(context));
                }
              }
          );
        } else {
          return this.builder(context, model);
        }
      },
    );
  }
}

// redux container with view model
class ViewContainer<ViewModel extends ViewState> extends StatelessWidget {
  // on init widget
  final void Function(Store<AppState>) init;
  // on select view model
  final void Function(Store<AppState>) select;
  // on widget dispose
  final void Function(Store<AppState>) dispose;
  // on build child widget
  final Widget Function(BuildContext, ViewModel) builder;

  ViewContainer({Key key, this.init, @required this.select, this.dispose, @required this.builder}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      onInit: this.init,
      converter: this.select,
      onDispose: this.dispose,
      builder: (context, model){
        if(model.isToLoad){
          return ToLoadIndicator(
            load: () {
              if(this.init != null){
                this.init(StoreProvider.of<AppState>(context));
              }
            }
          );
        } else if(model.isLoading){
          return LoadingIndicator();
        } else if(model.isFailed){
          return FailureIndicator(
            msg: model.tip,
            retry: () {
              if(this.init != null){
                this.init(StoreProvider.of<AppState>(context));
              }
            }
          );
        } else {
          return this.builder(context, model);
        }
      },
    );
  }
}

