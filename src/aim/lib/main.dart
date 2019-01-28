// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'src/state/app.dart';
import 'src/reducer/app.dart';
import 'src/middleware/app.dart';

import 'src/theme.dart';
import 'src/routes.dart';

void main() {
  runApp( new AimApp());
}

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
