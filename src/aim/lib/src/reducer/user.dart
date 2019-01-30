import 'package:redux/redux.dart';

import '../state/user.dart';
import '../action/user.dart';


final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, ActionUserLogin>(_userLogin),
  TypedReducer<UserState, ActionUserLoginSucceed>(_userLoginSucceed),
  TypedReducer<UserState, ActionUserLoginFailed>(_userLoginFailed),

  TypedReducer<UserState, ActionSessionLogin>(_sessionLogin),
  TypedReducer<UserState, ActionSessionLoginSucceed>(_sessionLoginSucceed),
  TypedReducer<UserState, ActionSessionLoginFailed>(_sessionLoginFailed),
]);


UserState _userLogin(UserState state, ActionUserLogin action) {
  return state.copyWith(status: ActionStatus.doing);
}

UserState _userLoginSucceed(UserState state, ActionUserLoginSucceed action) {
  return state.copyWith(status: ActionStatus.done, sid: action.sid, uid: action.uid);
}

UserState _userLoginFailed(UserState state, ActionUserLoginFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}

UserState _sessionLogin(UserState state, ActionSessionLogin action) {
  return state.copyWith(status: ActionStatus.doing);
}

UserState _sessionLoginSucceed(UserState state, ActionSessionLoginSucceed action) {
  return state.copyWith(status: ActionStatus.done, sid: action.sid, uid: action.uid);
}

UserState _sessionLoginFailed(UserState state, ActionSessionLoginFailed action) {
  return state.copyWith(status: ActionStatus.failed, error: action.error);
}
