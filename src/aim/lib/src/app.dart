import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'screens.dart';
import 'reduxs.dart';


class AimApp extends StatelessWidget{
  final Store<AppState> store = Store<AppState>(appReducer, initialState: AppState(), middleware: appMiddleware);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}