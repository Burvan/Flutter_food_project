abstract class SettingsRepository {
  Future<bool> checkTheme();
  Future<void> setTheme(bool isDark);
  Future<double> checkFontSize();
  Future<void> setFontSize(double textScale);
}