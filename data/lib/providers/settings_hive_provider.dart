import 'package:core/core.dart';

class SettingsHiveProvider {
  SettingsHiveProvider();

  Future<bool> getTheme () async {
    final Box themeBox = await Hive.openBox('theme');
    return themeBox.get('isDark').toString() == 'true' ? true : false;
  }

  Future<void> setTheme (bool isDark) async {
    final Box themeBox = await Hive.openBox('theme');
    return themeBox.put('isDark', isDark.toString());
  }

  Future<double> getFontSize () async {
    final Box fontSizeBox = await Hive.openBox('fontSize');
    return fontSizeBox.get('textScale');
  }
  
  Future<void> setFontSize (double textScale) async {
    final Box fontSizeBox = await Hive.openBox('fontSize');
    return fontSizeBox.put('textScale', textScale);
  }
}