import 'package:shared_preferences/shared_preferences.dart';

class ThemePersistance {
  //userge theme eka save karaganna(shared preferences use karala) method ekk hadanawa
  Future<void> storeTheme(bool isDark) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool("isDark", isDark);
    print("Theme Stored");
  }

  // user save karagaththa mode eka aye load karaganna method eka
  //boolian ekak save karagaththa nisa boolian ekak return karaganna ona
  Future<bool> loadTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Theme Loaded");
    return preferences.getBool("isDark") ?? false;
  }
}
