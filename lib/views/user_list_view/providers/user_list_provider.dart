import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/api/models/user_model.dart';
import 'package:my_first_flutter/views/user_list_view/view_model/user_list_view_model.dart';

final userListProvider =
    AsyncNotifierProvider<UserListViewModel, List<UserModel>>(
      UserListViewModel.new,
    );
