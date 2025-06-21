import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/api/models/user_model.dart';
import 'package:my_first_flutter/api/providers/service_provider.dart';

final userListViewModelProvider = Provider((ref) => UserListViewModel(ref));

class UserListViewModel {
  final Ref ref;

  UserListViewModel(this.ref);

  Future<List<UserModel>> fetchUsers() async {
    final service = ref.read(userApiServiceProvider);
    return await service.fetchUsers();
  }
}