part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class InitSettingsEvent extends SettingsEvent {
  const InitSettingsEvent();
}

class ChangeThemeEvent extends SettingsEvent {
  final bool isDark;

  ChangeThemeEvent({required this.isDark});
}