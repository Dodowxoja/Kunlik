import 'package:kunlik/view/screens/profile/pages/notification_settings/notification_settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSettingsCubit extends Cubit<NotificationSettingsState> {
  NotificationSettingsCubit() : super(NotificationSettingsInitial());

  bool notValue = true;
  bool promoValue = true;
  bool tipValue = true;
  bool upgradeValue = false;

  editValue1(bool v) {
    notValue = v;
    emit(NotificationSettingsComplete(notValue: notValue));
  }

  editValue2(bool v) {
    promoValue = v;
    emit(NotificationSettingsComplete(promoValue: promoValue));
  }

  editValue3(bool v) {
    tipValue = v;
    emit(NotificationSettingsComplete(tipValue: tipValue));
  }

  editValue4(bool v) {
    upgradeValue = v;
    emit(NotificationSettingsComplete(upgradeValue: upgradeValue));
  }
}
