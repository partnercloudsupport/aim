import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'app.dart';
import '../../app.dart';
import '../../routes.dart';
import '../../state/all.dart';
import '../../state/app.dart';
import '../../action/app.dart';

class LaunchContainer extends StatelessWidget {
  final Function(int delaySeconds) onFinished;
  LaunchContainer({Key key, this.onFinished}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataContainer<AppLaunch> (
      init: (store) {
        store.dispatch(ActionAppLaunch());
      },
      select: (store) {
        var model = store.state.appLaunch;
        if((model?.isLoaded??false) && !(model?.finished??false)) {
          // notify app launch fined
          App.dispatch(context, ActionAppLaunchFinished());
          // finished action
          this.onFinished(model.config?.duration??0);
        }
        return model;
      },
      builder: (context, model) {
        if(model.config.imageUrl == null){
          return Image.asset(
            model.config.assetKey,
            height: double.infinity,
            fit: BoxFit.fitHeight,
          );
        } else{
          return CachedNetworkImage(
              imageUrl: model.config.imageUrl,
              height: double.infinity,
              fit: BoxFit.fitHeight,
              errorWidget: Image.asset(
                model.config.assetKey,
                height: double.infinity,
                fit: BoxFit.fitHeight,
              )
          );
        }
      }
    );
  }
}