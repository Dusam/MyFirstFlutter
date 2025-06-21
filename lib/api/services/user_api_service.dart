import 'package:my_first_flutter/api/models/user_model.dart';
import 'package:my_first_flutter/api/network/api_client.dart';
import 'package:my_first_flutter/api/network/base_request_model.dart';

class UserApiService {
  final ApiClient client;

  UserApiService(this.client);

  Future<List<UserModel>> fetchUsers() async {
    final requestModel = BaseRequestModel(
      path: '/users',
      method: HttpMethod.get,
      headers: {'Accept': 'application/json'},
    );
    final response = await client.request(requestModel);
    final List data = response.data;
    return data.map((jsonData) => UserModel.fromJson(jsonData)).toList();
  }
}
