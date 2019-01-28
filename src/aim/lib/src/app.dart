import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'state/app.dart';
import 'reducer/app.dart';
import 'middleware/app.dart';

import 'theme.dart';
import 'routes.dart';



class AimApp extends StatelessWidget{
  final Store<StateApp> store = Store<StateApp>(appReducer, initialState: StateApp.init(), middleware: appMiddleware);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        debugShowMaterialGrid: false,
        showSemanticsDebugger: false,
        theme: AimTheme.theme,
        routes: AimRoutes.routes,
      ),
    );
  }
}