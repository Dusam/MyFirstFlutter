import 'package:flutter/material.dart';
import 'package:my_first_flutter/globals/colors.dart';
import 'package:my_first_flutter/views/settings_view/view/settings_view.dart';
import 'package:my_first_flutter/views/settings_view/view_model/theme_color_notifier.dart';
import 'package:my_first_flutter/views/user_list_view/view/user_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFirstFlutterApp extends ConsumerWidget {
  const MyFirstFlutterApp({super.key});

  // 只有這邊使用，因此不需放到全域
  static final selectedIndexProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final themeColor = ref.watch(themeColorProvider);

    final List<Widget> pages = [
      const UserListView(), // 第一頁
      const SettingsView(), // 第二頁
    ];

    final List<String> titles = ["用戶列表", "設定"];

    return MaterialApp(
      title: 'My First MVVM Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: themeBackgroundColor),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            titles[selectedIndex],
            style: TextStyle(color: barTextColor),
          ),
          backgroundColor: themeColor,
          centerTitle: true
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            // 更新狀態
            ref.read(selectedIndexProvider.notifier).state = index;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "使用者"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "設定"),
          ],
          backgroundColor: themeColor,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
