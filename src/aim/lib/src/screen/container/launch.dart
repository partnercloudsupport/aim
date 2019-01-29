import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../state/app.dart';
import '../../state/launch.dart';

class LaunchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LaunchState>(

    );
  }
}
