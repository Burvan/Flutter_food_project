import 'package:data/data.dart';
import 'package:domain/domain.dart' as domain;

class SettingsRepositoryImpl implements domain.SettingsRepository {
  final HiveProvider _hiveProvider;

  SettingsRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<bool> checkTheme() async{
    return _hiveProvider.getTheme();
  }

  @override
  Future<void> setTheme(bool isDark) async {
    return _hiveProvider.setTheme(isDark);
  }

  @override
  Future<double> checkFontSize() {
    return _hiveProvider.getFontSize();
  }

  @override
  Future<void> setFontSize(double textScale) {
    return _hiveProvider.setFontSize(textScale);
  }
}
