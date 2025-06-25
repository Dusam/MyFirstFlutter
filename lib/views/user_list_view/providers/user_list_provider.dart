import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/views/user_list_view/view_model/user_list_view_model.dart';

// ViewModel
final userListViewModelProvider = Provider((ref) => UserListViewModel(ref));

// List Data
final userListProvider = FutureProvider((ref) {
  final vm = ref.read(userListViewModelProvider);
  return vm.fetchUsers();
});
