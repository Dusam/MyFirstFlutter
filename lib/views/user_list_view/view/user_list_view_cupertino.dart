import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/global_assest/colors.dart';
import 'package:my_first_flutter/views/user_detail_view/view/user_detail_view_cupertino.dart';
import 'package:my_first_flutter/views/user_list_view/providers/user_list_provider.dart';

class UserListCupertinoView extends ConsumerWidget {
  const UserListCupertinoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListAsync = ref.watch(userListProvider);

    return userListAsync.when(
      data: (users) => CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: mainThemeColor,
          automaticBackgroundVisibility: false,
          middle: Text("用戶列表", style: TextStyle(color: CupertinoColors.white))
        ),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: () async {
                  await ref.read(userListProvider.notifier).refresh();
                },
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final user = users[index];
                  return Column(
                    children: [
                      CupertinoListTile(
                        padding: const EdgeInsets.all(10),
                        leadingSize: 50,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?u=${user.id}',
                          ),
                          radius: 30,
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 24,
                            color: CupertinoColors.black,
                          ),
                        ),
                        subtitle: Text(
                          user.email,
                          style: const TextStyle(
                            fontSize: 18,
                            color: CupertinoColors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute(
                              builder: (context) => UserDetailCupertinoView(user: user)
                            ),
                          );
                          print("user: ${user.name}");
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        height: 0.5,
                        color: CupertinoColors.systemGrey,
                      ),
                    ],
                  );
                }, childCount: users.length),
              ),
            ],
          ),
        ),
      ),
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (err, stack) => Center(child: Text('錯誤: $err')),
    );
  }
}
