enum HttpMethod { get, post, put, delete }

class BaseRequestModel {
  final String path;
  final HttpMethod method;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? queryParameters;
  final dynamic body;

  BaseRequestModel({
    required this.path,
    required this.method,
    this.headers,
    this.queryParameters,
    this.body,
  });
}
