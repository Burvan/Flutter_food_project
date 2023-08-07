part of 'settings_bloc.dart';

class SettingsState {
  final bool isDark;

  SettingsState({required this.isDark});

  SettingsState copyWith({
    bool? isDark,
  }) {
    return SettingsState(isDark: isDark ?? this.isDark);
  }
}
