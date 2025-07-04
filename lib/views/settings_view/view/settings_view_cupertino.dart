import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/globals/colors.dart';
import 'package:my_first_flutter/globals/widgets/custom_divider.dart';
import 'package:my_first_flutter/views/settings_view/view_model/theme_color_notifier.dart';
import 'package:my_first_flutter/views/theme_color_picker_view/theme_color_page_cupertino.dart';

class SettingsCupertinoView extends ConsumerWidget {
  const SettingsCupertinoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColor = ref.watch(themeColorProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("設定", style: TextStyle(color: barTextColor)),
        backgroundColor: themeColor,
        automaticBackgroundVisibility: false,
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    buildSettingsListTile("主題顏色", () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (context) => const ThemeColorPickerCupertinoPage(),
                        ),
                      );
                    }),
                    const CustomDivider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsListTile(String title, VoidCallback onTap) {
    return CupertinoListTile(
      padding: const EdgeInsets.all(10),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      trailing: Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}
