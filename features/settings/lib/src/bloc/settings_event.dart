part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class ChangeThemeEvent extends SettingsEvent {
  ChangeThemeEvent();
}