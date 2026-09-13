import 'package:envied/envied.dart';
part 'api_consts.g.dart';

@Envied(path: '.env', requireEnvFile: true)
abstract class ApiConsts {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _ApiConsts.baseUrl;
  @EnviedField(varName: 'SIGN_UP')
  static const String signup = _ApiConsts.signup;
    @EnviedField(varName: 'OTP_VERFICATION')
  static const String otpVerfication = _ApiConsts.otpVerfication;
@EnviedField(varName: 'LOGIN')
  static const String login = _ApiConsts.login;
}
