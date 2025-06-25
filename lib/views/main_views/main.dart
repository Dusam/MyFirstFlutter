import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_first_flutter/views/main_views/cupertino_style_app.dart';
import 'package:my_first_flutter/views/main_views/material_style_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  if (Platform.isAndroid) {
    runApp(const ProviderScope(child: MyFirstFlutterApp()));
  } else if (Platform.isIOS) {
    runApp(const ProviderScope(child: MyFirstFlutterCupertinoApp()));
  }
}

// StatefulWidget 寫法

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<StatefulWidget> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int _selectedIndex = 0;

//   final List<Widget> pages = [
//     UserListView(), // 第一頁
//     Center(child: Text('設定頁面')), // 第二頁
//   ];

//   final List<String> titles = ["用戶列表", "設定"];

//   // Bottom bar selected index
//   void onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My First MVVM Flutter Demo',
//       theme: ThemeData(scaffoldBackgroundColor: themeBackgroundColor),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             titles[_selectedIndex],
//             style: TextStyle(color: barTextColor),
//           ),
//           backgroundColor: mainThemeColor,
//           centerTitle: true,
//         ),
//         body: pages[_selectedIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: onItemTapped,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.list), label: "使用者"),
//             BottomNavigationBarItem(icon: Icon(Icons.settings), label: "設定"),
//           ],
//           backgroundColor: mainThemeColor,
//           selectedItemColor: selectedItemColor,
//           unselectedItemColor: unselectedItemColor,
//           selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
