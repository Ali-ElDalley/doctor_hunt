import 'package:envied/envied.dart';
part 'api_consts.g.dart';

@Envied(path: '.env', requireEnvFile: true)
abstract class ApiConsts {
  @EnviedField(varName: 'PROJECT_URL')
  static const String projectUrl = _ApiConsts.projectUrl;
  @EnviedField(varName: 'KEY')
  static const String key = _ApiConsts.key;

}
