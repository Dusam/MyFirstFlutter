import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/views/user_list_view/view_model/user_list_view_model.dart';

class UserListView extends ConsumerWidget {
  UserListView({super.key});

  final userListProvider = FutureProvider((ref) {
    final vm = ref.read(userListViewModelProvider);
    return vm.fetchUsers();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListAsync = ref.watch(userListProvider);

    return userListAsync.when(
      data: (users) => ListView.separated(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(
              user.name,
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            subtitle: Text(
              user.email,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const Divider(thickness: 1, height: 0.5, color: Colors.grey),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('錯誤: $err')),
    );
  }
}
