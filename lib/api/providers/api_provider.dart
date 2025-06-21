import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_flutter/api/network/api_client.dart';

final baseApiClientProvider = Provider((ref) => ApiClient());
