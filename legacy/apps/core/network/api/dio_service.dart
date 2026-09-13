
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart';

import '../../error/server_exception.dart';
import 'api_consts.dart';
import 'api_consumer.dart';

class DioService implements ApiConsumer {
  final Dio dio;

  DioService({required this.dio}) {
    _initDio();
  }
  void _initDio() {
    dio.options.baseUrl = ApiConsts.baseUrl;
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        request: true,
      ),
    );
  }

  @override
  Future<dynamic>? delete({required String path}) {
    return null;
  }

  @override
  Future<dynamic>? get({
    required String path,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      Response res = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      var statusCode = res.statusCode!;
      if (statusCode >= 200 && statusCode < 300) {
        return res.data;
      } else {
        throw ServerException(data: res.data, message: res.statusMessage);
      }
    } catch (e) {
      await _handleException(e);
    }
  }

  @override
  Future<dynamic>? paton({required String path}) {
    return null;
  }

  @override
  Future<dynamic>? post({
    required String path,
    Object? body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response res = await dio.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      var statusCode = res.statusCode!;
      if (statusCode >= 200 && statusCode < 300) {
        return res.data;
      } else {
        throw ServerException(data: res.data, message: res.statusMessage);
      }
    } catch (e) {
      await _handleException(e);
    }
  }

  Future<void> _handleException(e) async {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          // TODO: Handle this case.
          throw ServerException(
            message: e.message,
            data: {"error": e.error.toString()},
          );
        case DioExceptionType.sendTimeout:
          // TODO: Handle this case.
          throw ServerException(
            message: e.message,
            data: {"error": e.error.toString()},
          );
        case DioExceptionType.receiveTimeout:
          // TODO: Handle this case.
          throw ServerException(
            message: e.message,
            data: {"error": e.error.toString()},
          );
        case DioExceptionType.badCertificate:
          // TODO: Handle this case.
          throw ServerException(
            message: e.message,
            data: {"error": e.error.toString()},
          );
        case DioExceptionType.badResponse:
          final responseData = e.response?.data;
          throw ServerException(
            message: e.response?.statusMessage,
            data: responseData is Map<String, dynamic>
                ? responseData
                : {
                    "statusCode": e.response?.statusCode ?? 400,
                    "error": ["Unexpected response format"],
                  },
          );
        case DioExceptionType.cancel:
          // TODO: Handle this case.
          throw ServerException(
            message: e.message,
            data: {"error": e.error.toString()},
          );
        case DioExceptionType.connectionError:
          // TODO: Handle this case.
          throw ServerException(
            message: e.message,
            data: {"error": e.error.toString()},
          );
        case DioExceptionType.unknown:
          // TODO: Handle this case.
          throw ServerException(
            message: e.message,
            data: {"error": e.error.toString()},
          );
        case DioExceptionType.transformTimeout:
          // TODO: Handle this case.
          throw ServerException(
            message: e.message,
            data: {"error": e.error.toString()},
          );
      }
    } else {
      throw e;
    }
  }

  @override
  Future<dynamic>? put({required String path}) {
    return null;
  }
}
