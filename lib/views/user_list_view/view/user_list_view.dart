import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/global_assest/colors.dart';
import 'package:my_first_flutter/views/user_list_view/view_model/user_list_view_model.dart';

class UserListView extends ConsumerWidget {
  const UserListView({super.key});

  static final userListProvider = FutureProvider((ref) {
    final vm = ref.read(userListViewModelProvider);
    return vm.fetchUsers();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListAsync = ref.watch(userListProvider);

    return userListAsync.when(
      data: (users) => RefreshIndicator(
        color: mainThemeColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          ref.invalidate(userListProvider);
          await ref.read(userListProvider.future);
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
              onTap: () => print("user: ${user.name}"),
            );
          },
          separatorBuilder: (context, index) =>
              const Divider(thickness: 1, height: 0.5, color: Colors.grey),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('錯誤: $err')),
    );
  }
}
