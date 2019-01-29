import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../routes.dart';
import '../assets.dart';
import '../config.dart';
import '../state/app.dart';
import '../state/launch.dart';
import '../action/launch.dart';

class LaunchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, StateLaunch> (
        onInit: (store) {
          store.dispatch(ActionLaunch());
        },
        converter: (store) {
          return Selectors.launch(store.state);
        },
        builder: (context, launch) {
          if(!launch.state.isLoading){
            Future.delayed(Duration(seconds: 3), (){
              Navigator.of(context).pushReplacementNamed(AimRoutes.home);
            });
          }

          return CachedNetworkImage(
            imageUrl: Config.app.image.launch,
            height: double.infinity,
            fit: BoxFit.fitHeight,
//            errorWidget: Image.asset(
//              Assets.imageLaunch,
//              height: double.infinity,
//              fit: BoxFit.fitHeight,
//            ),
//            placeholder: Image.asset(
//              Assets.imageLaunch,
//              height: double.infinity,
//              fit: BoxFit.fitHeight,
//            ),
          );
        },
      ),
    );
  }
}
