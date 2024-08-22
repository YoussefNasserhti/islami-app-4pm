import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{

  void changeLang(BuildContext context , String lang){
    context.setLocale(Locale(lang));
    notifyListeners();
  }

  ThemeMode themeMode = ThemeMode.dark;
  void changeTheme(ThemeMode themeMode){
    this.themeMode = themeMode;
    notifyListeners();
  }
}