import 'package:flutter/material.dart';
import 'package:weather/services/theme_persistance.dart';
import 'package:weather/utils/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemesModeData().lightMode;

  //class eke constructor eke theme eka load karaganna method ekk call karaganna
  ThemeProvider() {
    _loadTheme();
  }
  //1 mulinnam variable ekk hadagannawa
  final ThemePersistance _themePersistance = ThemePersistance();

  //value ekk access karanna getter method ekak hadagannawa
  ThemeData get getThemeData => _themeData;

  //setter
  set setThemeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  //user save karagaththa theme eka load karaganna method ekk
  Future<void> _loadTheme() async {
    // isDark variable ekata userge save karagtta theme eka load karagannawa
    bool isDark = await _themePersistance.loadTheme();

    //setter eka haraha theme eka set karaganna
    setThemeData = isDark
        ? ThemesModeData().darkMode
        : ThemesModeData().lightMode;
  }

  //toggle theme
  Future<void> toggleTheme(bool isDark) async {
    setThemeData = isDark
        ? ThemesModeData().darkMode
        : ThemesModeData().lightMode;

    await _themePersistance.storeTheme(isDark);
    notifyListeners();
  }
}
