import 'package:flutter/material.dart';

/// Gère l'état du thème (clair / sombre) de toute l'application.
/// En s'abonnant à ce provider, n'importe quel widget peut changer
/// le thème global sans avoir à connaître les autres écrans.
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme(bool activateDarkMode) {
    _themeMode = activateDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
