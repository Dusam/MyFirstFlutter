import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/globals/widgets/custom_divider.dart';
import 'package:my_first_flutter/views/settings_view/view_model/theme_color_notifier.dart';
import 'package:my_first_flutter/views/user_detail_view/view/user_detail_view.dart';
import 'package:my_first_flutter/views/user_list_view/providers/user_list_provider.dart';

class UserListView extends ConsumerWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListAsync = ref.watch(userListProvider);
    final themeColor = ref.watch(themeColorProvider);

    return userListAsync.when(
      data: (users) => RefreshIndicator(
        color: themeColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          await ref.read(userListProvider.notifier).refresh();
        },
        child: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?u=${user.id}',
                ),
                radius: 24,
              ),
              title: Text(
                user.name,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
              subtitle: Text(
                user.email,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UserDetailView(user: user)),
                );
                print("user: ${user.name}");
              },
            );
          },
          separatorBuilder: (context, index) => const CustomDivider(),
        ),
      ),
      loading: () =>
          Center(child: CircularProgressIndicator(color: themeColor)),
      error: (err, stack) => Center(child: Text('錯誤: $err')),
    );
  }
}
