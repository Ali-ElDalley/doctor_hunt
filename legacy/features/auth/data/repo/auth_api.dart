
import '../../../../apps/core/error/failure_model.dart';
import '../../../../apps/core/error/server_exception.dart';
import '../../../../apps/core/extensions/get_it_extension.dart';
import '../../../../apps/core/network/api/api_consts.dart';
import '../../../../apps/core/network/api/dio_service.dart';
import '../../../../apps/core/utils/get_it_service.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';
import '../models/otp_request_model.dart';
import '../models/signup_request_model.dart';
import 'package:dartz/dartz.dart';

class AuthApi {
  const AuthApi._();
  static Future<Either<String, AuthResponseModel>> signup(
    SignupRequestModel signupRequestModel,
  ) async {
    try {
      DioService dioService = getIt.dioService;
      var res = await dioService.post(
        path: ApiConsts.signup,
        body: await signupRequestModel.toFormData(),
      );
      return right(AuthResponseModel.fromJson(res));
    } on ServerException catch (e) {
      return left(
        FailureModel.fromJson(Map<String, dynamic>.from(e.data)).toString(),
      );
    } catch (e) {
      return left(
        FailureModel(statusCode: 400, error: ["Uknown error"]).toString(),
      );
    }
  }

  static Future<Either<String, AuthResponseModel>> verification({
    required OtpRequestModel otpRequestModel,
  }) async {
    try {
      DioService dioService = getIt.dioService;
      var res = await dioService.post(
        path: ApiConsts.otpVerfication,
        body: otpRequestModel.toFormData(),
      );
      return right(AuthResponseModel.fromJson(res));
    } on ServerException {
      return left("l");
    } catch (e) {
      return left("l");
    }
  }

  static Future<Either<String, AuthResponseModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      DioService dioService = getIt.dioService;
      var res = await dioService.get(
        path: ApiConsts.login,
        queryParameters: loginRequestModel.toJson(),
      );
      return right(AuthResponseModel.fromJson(res));
    } on ServerException catch (e) {
      return left(
        FailureModel.fromJson(Map<String, dynamic>.from(e.data)).toString(),
      );
    } catch (e) {
      return left(
        FailureModel(statusCode: 400, error: ["Uknown error"]).toString(),
      );
    }
  }
}
