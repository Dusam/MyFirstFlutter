import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/globals/widgets/custom_divider.dart';
import 'package:my_first_flutter/views/theme_color_picker_view/theme_color_page.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15),
        children: [
          buildListTile("主題顏色", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ThemeColorPickerPage()),
            );
          }),
          const CustomDivider(),
        ],
      ),
    );
  }

  Widget buildListTile(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 20)),
      trailing: Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}
