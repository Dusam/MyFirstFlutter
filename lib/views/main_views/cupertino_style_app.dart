import 'package:flutter/cupertino.dart';
import 'package:my_first_flutter/global_assest/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/views/user_list_view/view/user_list_view_cupertino.dart';


class MyFirstFlutterCupertinoApp extends ConsumerWidget {
  const MyFirstFlutterCupertinoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: 'My Cupertino App',
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: CupertinoColors.white,
        primaryColor: CupertinoColors.white
      ),
      home: const MainTabScaffold(),
    );
  }
}

class MainTabScaffold extends StatelessWidget {
  const MainTabScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: mainThemeColor,
        activeColor: barTextColor,
        inactiveColor: CupertinoColors.systemGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            label: '用戶',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: '設定',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return const UserListCupertinoView();
              case 1:
                return const Center(child: Text('設定頁面'));
              default:
                return const Center(child: Text('未知頁面'));
            }
          },
        );
      },
    );
  }
}
