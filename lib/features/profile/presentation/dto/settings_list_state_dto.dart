class SettingsListStateDto {
  bool valueNotification;
  bool valueMode;
  bool valueTimer;

  SettingsListStateDto(
      this.valueNotification, this.valueMode, this.valueTimer);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsListStateDto &&
          runtimeType == other.runtimeType &&
          valueNotification == other.valueNotification &&
          valueMode == other.valueMode &&
          valueTimer == other.valueTimer;

  @override
  int get hashCode =>
      valueNotification.hashCode ^ valueMode.hashCode ^ valueTimer.hashCode;
}
