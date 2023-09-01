import 'package:data/providers/settings_hive_provider.dart';
import 'package:domain/domain.dart' as domain;

class SettingsRepositoryImpl implements domain.SettingsRepository {
  final SettingsHiveProvider _settingsHiveProvider;

  SettingsRepositoryImpl({
    required SettingsHiveProvider settingsHiveProvider,
  }) : _settingsHiveProvider = settingsHiveProvider;

  @override
  Future<bool> checkTheme(domain.NoParams payload) async{
    return _settingsHiveProvider.getTheme();
  }

  @override
  Future<void> setTheme(bool isDark) async {
    return _settingsHiveProvider.setTheme(isDark);
  }

  @override
  Future<double> checkFontSize(domain.NoParams payload) {
    return _settingsHiveProvider.getFontSize();
  }

  @override
  Future<void> setFontSize(double textScale) {
    return _settingsHiveProvider.setFontSize(textScale);
  }
}
