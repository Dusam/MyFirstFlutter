import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/globals/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final preferencesServiceProvider = Provider<SharedPreferencesService>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider).value;
  if (preferences == null) {
    throw Exception('SharedPreferences 未初始化');
  }
  return SharedPreferencesService(preferences);
});

class SharedPreferencesService {
  final SharedPreferences preferences;

  SharedPreferencesService(this.preferences);

  static const themeColor = 'theme_color';

  Color getThemeColor() {
    return Color(preferences.getInt(themeColor) ?? mainThemeColor.toARGB32());
  }

  Future<void> setThemeColor(int color) async {
    await preferences.setInt(themeColor, color);
  }
}
