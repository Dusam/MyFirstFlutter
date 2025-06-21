import 'package:dio/dio.dart';
import 'base_request_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );

  Future<Response<dynamic>> request(BaseRequestModel requestModel) async {
    try {
      final options = Options(
        headers: requestModel.headers,
        method: requestModel.method.name.toUpperCase(),
      );
      final response = await dio.request(
        requestModel.path,
        data: requestModel.body,
        queryParameters: requestModel.queryParameters,
        options: options,
      );
      return response;
    } on DioException {
      throw Exception('API error: \${e.message}');
    }
  }
}
