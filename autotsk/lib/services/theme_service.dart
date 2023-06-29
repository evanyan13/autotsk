import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = "isDarkMode";
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  // Whether the value within [_key] is true
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  // Get theme mode based on the value returned from [_loadThemeFromBox()] method
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  // Based on the [theme] retrieved, switch the ThemeMode to the other
  // Where ThemeMode.light is default
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    // Allow to toggle between ThemeMode
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
