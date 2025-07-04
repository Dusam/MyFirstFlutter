import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/globals/colors.dart';
import 'package:my_first_flutter/views/settings_view/view_model/theme_color_notifier.dart';
import 'package:my_first_flutter/views/theme_color_picker_view/theme_color_picker_view.dart';

class ThemeColorPickerCupertinoPage extends ConsumerWidget {
  const ThemeColorPickerCupertinoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentColor = ref.watch(themeColorProvider);
    final themeColor = ref.watch(themeColorProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("選擇主題顏色", style: TextStyle(color: barTextColor)),
        backgroundColor: themeColor,
        automaticBackgroundVisibility: false,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ThemePickerView(
            selectedColor: currentColor,
            onColorSelected: (color) {
              ref.read(themeColorProvider.notifier).setThemeColor(color);
            },
          ),
        ),
      ),
    );
  }
}
