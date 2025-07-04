import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/globals/local/shared_preferences_service.dart';

final themeColorProvider = StateNotifierProvider<ThemeColorNotifier, Color>(
  (ref) => ThemeColorNotifier(ref.watch(preferencesServiceProvider)),
);

class ThemeColorNotifier extends StateNotifier<Color> {
  final SharedPreferencesService preferencesService;

  ThemeColorNotifier(this.preferencesService)
    : super(preferencesService.getThemeColor());

  Future<void> setThemeColor(Color color) async {
    state = color;
    await preferencesService.setThemeColor(color.toARGB32());
  }
}
