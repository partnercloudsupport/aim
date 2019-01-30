import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../routes.dart';
import '../state/app.dart';
import '../state/launch.dart';
import '../action/launch.dart';
import 'container/builder.dart';

class LaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, LaunchState> (
          onInit: (store) {
            store.dispatch(ActionLaunch());
          },
          converter: (store) {
            return Selector.launch(store.state);
          },
          onDidChange: (launchState){
            if(launchState.isDone && !launchState.finished) {
              // delay for duration to home page
              Future.delayed(Duration(seconds: launchState.duration)).then((value){
                Navigator.of(context).pushReplacementNamed(AimRoutes.home);
              });

              // launch finished
              StoreProvider.of<AppState>(context).dispatch(ActionLaunchFinished());
            }
          },
          builder: (context, launchState) {
            return StateBuilder<LaunchState>(
                state: launchState,
                action: () {
                  StoreProvider.of<AppState>(context).dispatch(ActionLaunch());
                },
                builder: (context, launchState) {
                  return CachedNetworkImage(
                    imageUrl: launchState.imageUrl,
                    height: double.infinity,
                    fit: BoxFit.fitHeight,
                    errorWidget: Image.asset(
                      launchState.assetKey,
                      height: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                    placeholder: Image.asset(
                      launchState.assetKey,
                      height: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  );
                }
            );
          }
      ),
    );
  }
}
