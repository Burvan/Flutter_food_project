import 'package:domain/domain.dart';

abstract class SettingsRepository {
  Future<bool> checkTheme(NoParams payload);
  Future<void> setTheme(bool isDark);
  Future<double> checkFontSize(NoParams payload);
  Future<void> setFontSize(double textScale);
}