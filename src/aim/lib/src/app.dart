import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'state/app.dart';
import 'reducer/app.dart';
import 'middleware/app.dart';

import 'package:aim/src/screen/home.dart';
import 'package:aim/src/theme.dart';



class AimApp extends StatelessWidget{
  final Store<StateApp> store = Store<StateApp>(appReducer, initialState: StateApp.init(), middleware: appMiddleware);

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