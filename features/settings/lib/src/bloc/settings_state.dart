part of 'settings_bloc.dart';

class SettingsState extends Equatable{
  final bool isDark;
  final ThemeData themeData;
  final double textScale;

  const SettingsState({
    required this.isDark,
    required this.themeData,
    required this.textScale,
  });

  SettingsState copyWith({
    bool? isDark,
    ThemeData? themeData,
    double? textScale,
  }) {
    return SettingsState(
      isDark: isDark ?? this.isDark,
      themeData: themeData ?? this.themeData,
      textScale: textScale ?? this.textScale,
    );
  }

  @override

  List<Object?> get props => <Object?>[
    isDark,
    themeData,
    textScale,
  ];
}
