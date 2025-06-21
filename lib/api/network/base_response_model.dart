class BaseResponseModel<T> {
  final bool success;
  final String? message;
  final T? data;

  BaseResponseModel({required this.success, this.message, this.data});
}
