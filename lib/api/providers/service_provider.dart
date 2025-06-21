import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/api/providers/api_provider.dart';
import 'package:my_first_flutter/api/services/user_api_service.dart';

final userApiServiceProvider = Provider(
  (ref) => UserApiService(ref.read(baseApiClientProvider)),
);
