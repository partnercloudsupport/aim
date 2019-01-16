import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux/state.dart';
import 'redux/reducer.dart';
import 'redux/middleware.dart';

import 'view/home.dart';
import 'view/theme.dart';



class AimApp extends StatelessWidget{
  final Store<AppState> store = Store<AppState>(appReducer, initialState: AppState.init(), middleware: appMiddleware);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        debugShowMaterialGrid: false,
        showSemanticsDebugger: false,
        home: HomePage(),
        theme: AimTheme.theme,
      ),
    );
  }
}