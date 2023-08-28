part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class InitThemeEvent extends SettingsEvent {
  const InitThemeEvent();
}

class ChangeThemeEvent extends SettingsEvent {
  ChangeThemeEvent();
}