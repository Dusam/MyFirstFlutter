import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/api/models/user_model.dart';
import 'package:my_first_flutter/globals/colors.dart';
import 'package:my_first_flutter/views/settings_view/view_model/theme_color_notifier.dart';

class UserDetailView extends ConsumerWidget {
  const UserDetailView({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = user.address;
    final company = user.company;
    final themeColor = ref.watch(themeColorProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name, style: TextStyle(color: barTextColor)),
        backgroundColor: themeColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: barTextColor),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const SizedBox(height: 15),
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.grey[200],
            child: ClipOval(
              child: Image.network(
                'https://i.pravatar.cc/150?u=${user.id}',
                fit: BoxFit.cover,
                width: 90,
                height: 90,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            user.username,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          const Text(
            "個人資訊",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

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
    );
  }

  Widget buildInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        tileColor: Colors.grey.shade100,
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
          style: const TextStyle(fontSize: 18, color: Colors.black87),
          maxLines: 5,
        ),
      ),
    );
  }
}
