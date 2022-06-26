abstract class NotificationSettingsState {}

class NotificationSettingsInitial extends NotificationSettingsState {}

class NotificationSettingsLoading extends NotificationSettingsState {}

class NotificationSettingsComplete extends NotificationSettingsState {
  bool? notValue;
  bool? promoValue;
  bool? tipValue;
  bool? upgradeValue;
  NotificationSettingsComplete({
    this.notValue,
    this.promoValue,
    this.tipValue,
    this.upgradeValue,
  });
}

class NotificationSettingsErrors extends NotificationSettingsState {}
