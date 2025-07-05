import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/api/models/user_model.dart';
import 'package:my_first_flutter/api/providers/service_provider.dart';
import 'package:my_first_flutter/api/services/user_api_service.dart';

class UserListViewModel extends AsyncNotifier<List<UserModel>> {
  late final UserApiService service;

  @override
  Future<List<UserModel>> build() async {
    service = ref.read(userApiServiceProvider);
    return await fetchUsers();
  }

  Future<List<UserModel>> fetchUsers() async {
    final users = await service.fetchUsers();
    state = AsyncValue.data(users);
    return users;
  }

  Future<void> refresh() async {
    // state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => fetchUsers());
  }
}
