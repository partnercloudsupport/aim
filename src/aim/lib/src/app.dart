import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'reduxs.dart';
import 'widget/home.dart';



class AimApp extends StatelessWidget{
  final Store<AppState> store = Store<AppState>(appReducer, initialState: AppState(), middleware: appMiddleware);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        debugShowMaterialGrid: false,
        showSemanticsDebugger: false,
        home: HomePage(),
        theme: ThemeData.light(),
      ),
    );
  }
}