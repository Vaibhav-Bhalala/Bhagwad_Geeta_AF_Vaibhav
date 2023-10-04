import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/theme_model.dart';


class ThemeProvider extends ChangeNotifier {
  ThemeChange themeChange = ThemeChange(isDark: false);

  void ChangeTheme() {
    themeChange.isDark = !themeChange.isDark;
    notifyListeners();
  }
}