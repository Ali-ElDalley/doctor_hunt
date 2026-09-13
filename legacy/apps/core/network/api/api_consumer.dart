abstract class ApiConsumer {
  const ApiConsumer();
  get({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
  });
  post({
    required String path,
    Object? body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
  });
  delete({required String path});
  paton({required String path});
  put({required String path});
}
