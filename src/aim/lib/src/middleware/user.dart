import 'package:redux/redux.dart';
import '../state/app.dart';
import '../model/user.dart';
import '../local/all.dart';
import '../remote/all.dart';
import '../action/user.dart';

Future<void> userLogin(Store<AppState> store, ActionUserLogin action, NextDispatcher next) async {
  try{
    // dispatch to next
    next(action);

    // session login
    ModelUser user = await Remote.user.userLogin(action.user, action.pwd);
    store.dispatch(ActionUserLoginSucceed(sid: user?.sid, uid: user?.uid));
  } catch(e) {
    store.dispatch(ActionUserLoginFailed(error: e.toString()));
  }
}

Future<void> sessionLogin(Store<AppState> store, ActionSessionLogin action, NextDispatcher next) async {
  try{
    // dispatch to next
    next(action);

    // session login
    ModelUser user = await Remote.user.sessionLogin(action.sid, action.uid);
    // save to local
    await Local.sp.setUser(user);
    store.dispatch(ActionSessionLoginSucceed(sid: user?.sid, uid: user?.uid));
  } catch(e) {
    store.dispatch(ActionSessionLoginFailed(error: e.toString()));
  }
}
