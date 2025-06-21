import 'package:flutter/material.dart';
import 'package:my_first_flutter/global_assest/colors.dart';
import 'package:my_first_flutter/views/user_list_view/view/user_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    UserListView(), // 第一頁
    Center(child: Text('設定頁面')), // 第二頁
  ];

  final List<String> _titles = ["用戶列表", "設定"];

  // Bottom bar selected index
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First MVVM Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: themeBackgroundColor),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _titles[_selectedIndex],
            style: TextStyle(color: barTextColor),
          ),
          backgroundColor: mainThemeColor,
          centerTitle: true,
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "使用者"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "設定"),
          ],
          backgroundColor: mainThemeColor,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
