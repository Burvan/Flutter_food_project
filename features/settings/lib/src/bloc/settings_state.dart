part of 'settings_bloc.dart';

class SettingsState extends Equatable{
  final bool isDark;
  final ThemeData themeData;

  const SettingsState({
    required this.isDark,
    required this.themeData,
  });

  SettingsState copyWith({
    bool? isDark,
    ThemeData? themeData,
  }) {
    return SettingsState(
      isDark: isDark ?? this.isDark,
      themeData: themeData ?? this.themeData,
    );
  }

  @override

  List<Object?> get props => <Object?>[
    isDark,
    themeData,
  ];
}
