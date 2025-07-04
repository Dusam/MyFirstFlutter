import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/api/models/user_model.dart';
import 'package:my_first_flutter/globals/colors.dart';
import 'package:my_first_flutter/views/settings_view/view_model/theme_color_notifier.dart';

class UserDetailCupertinoView extends ConsumerWidget {
  const UserDetailCupertinoView({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Address address = user.address;
    final Company company = user.company;
    final themeColor = ref.watch(themeColorProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(user.name, style: TextStyle(color: barTextColor)),
        backgroundColor: themeColor,
        automaticBackgroundVisibility: false,
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?u=${user.id}',
                    ),
                    radius: 24,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    user.username,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: CupertinoListSection(
                additionalDividerMargin: 0,
                dividerMargin: 0,
                header: const Text(
                  "個人資訊",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                children: [
                  buildInfoTile(
                    "住址",
                    "${address.zipcode} ${address.city} ${address.street} ${address.suite}",
                  ),
                  buildInfoTile("公司", company.name),
                  buildInfoTile("電話", user.phone),
                  buildInfoTile("網站", user.website),
                  buildInfoTile("信箱", user.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(String title, String value) {
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
      subtitle: Text(
        value,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
