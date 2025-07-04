import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/globals/colors.dart';
import 'package:my_first_flutter/views/settings_view/view_model/theme_color_notifier.dart';
import 'package:my_first_flutter/views/theme_color_picker_view/theme_color_picker_view.dart';

class ThemeColorPickerPage extends ConsumerWidget {
  const ThemeColorPickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentColor = ref.watch(themeColorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("選擇主題顏色", style: TextStyle(color: barTextColor)),
        backgroundColor: currentColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: barTextColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ThemePickerView(
          selectedColor: currentColor,
          onColorSelected: (color) {
            ref.read(themeColorProvider.notifier).setThemeColor(color);
          },
        ),
      ),
    );
  }
}
