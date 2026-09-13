class ServerException implements Exception {
  final String? message;
  final Map data;
  const ServerException({ this.message, required this.data});
  
}
