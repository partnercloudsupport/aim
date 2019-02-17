import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'app.dart';
import '../../routes.dart';
import '../../state/all.dart';
import '../../state/app.dart';
import '../../action/app.dart';

class LaunchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataContainer<AppLaunch> (
      action: ActionAppLaunch(),
      select: (state) {
        return state.appLaunch;
      },
      changed: (state){
        if(state.isLoaded) {
          // delay for duration to home page
          Future.delayed(Duration(seconds: state.config.duration)).then((value){
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          });
        }
      },
      builder: (context, state) {
        if(state.config.imageUrl == null){
          return Image.asset(
            state.config.assetKey,
            height: double.infinity,
            fit: BoxFit.fitHeight,
          );
        } else{
          return CachedNetworkImage(
              imageUrl: state.config.imageUrl,
              height: double.infinity,
              fit: BoxFit.fitHeight,
              errorWidget: Image.asset(
                state.config.assetKey,
                height: double.infinity,
                fit: BoxFit.fitHeight,
              )
          );
        }
      }
    );

  }
}