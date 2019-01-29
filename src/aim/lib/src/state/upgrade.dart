import 'base.dart';
export 'base.dart';


class UpgradeState extends StateBase {
  bool canceled;
  UpgradeState({ActionStatus status, this.canceled, String error}): super(status: status, error: error);

  factory UpgradeState.init() {
    return UpgradeState(
      status: ActionStatus.todo
    );
  }
}