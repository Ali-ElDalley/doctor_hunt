
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../network/api/dio_service.dart';
import '../network/hive/flutter_secure_storage_manager.dart';
import '../utils/get_it_service.dart';

extension GetItExtension on GetIt {
  Dio get dio => getIt<Dio>();
  DioService get dioService => getIt<DioService>();
  ImagePicker get imagePicker => getIt<ImagePicker>();
  FlutterSecureStorageManager get secureStorage =>
      getIt<FlutterSecureStorageManager>();
}
