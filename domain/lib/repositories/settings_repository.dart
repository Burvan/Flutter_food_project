import 'package:domain/domain.dart';

abstract class SettingsRepository {
  Future<bool> checkTheme(NoParams payload);
  Future<void> setTheme(bool isDark);
}